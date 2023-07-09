import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanpro/screens/DetailsPage.dart';
import 'package:scanpro/screens/addItem.dart';
import '../widgets/BottomNavigationBar.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  static const String routName = "/inventory-page";

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  int _currentIndex = 0;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.chevron_back),
        ),
        title: Container(
          height: 40,
          width: 300,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFE8ECF4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Product Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Perform search or filter logic based on _searchQuery
                  // You can use _searchQuery to filter the products displayed in the DataTable
                  print("Search: $_searchQuery");
                },
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventoryPage()),
              );
              break;
            case 1:
              FlutterBarcodeScanner.scanBarcode(
                      "#ff6666", "Cancel", true, ScanMode.BARCODE)
                  .then((value) {
                // Handle the scanned barcode here
                print("Scanned: $value");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddItemPage(),
                    settings: RouteSettings(arguments: value),
                  ),
                );
              });
              break;

            // case 2:
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const InventoryPage()),
            //   );
            //   break;
            // default:
            // Handle invalid index
          }
        },
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          // Filter the products based on the search query
          final filteredProducts = snapshot.data!.docs.where((document) {
            final productName = document['name'] ?? '';
            return productName
                .toLowerCase()
                .contains(_searchQuery.toLowerCase());
          }).toList();

          // Data is fetched and filtered successfully
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 30, top: 15),
                  child: DataTable(
                    dataRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.grey.shade200,
                    ),
                    headingTextStyle: const TextStyle(color: Colors.white),
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 22, 38, 70),
                    ),
                    columns: const [
                      DataColumn(label: Text('Product Name')),
                      DataColumn(label: Text('MRP')),
                      DataColumn(label: Text('Weight')),
                    ],
                    rows: filteredProducts.map((DocumentSnapshot document) {
  var productName = document['name'] ?? '';
  var mrp = document['mrp']?.toString() ?? '';
  var weight = document['weight']?.toString() ?? '';

  return DataRow(
    cells: [
      DataCell(
        Text(productName),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(
                productName: productName,
                mrp: mrp,
                weight: weight,
                // Provide the necessary values for description
              ),
            ),
          );
        },
      ),
      DataCell(Text(mrp)),
      DataCell(Text(weight)),
    ],
  );
}).toList(),

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
