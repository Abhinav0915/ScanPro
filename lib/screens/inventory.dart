import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFE8ECF4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Enter Product Name",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Icon(
                CupertinoIcons.search,
                color: Colors.grey,
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
  FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE)
    .then((value) {
      // Handle the scanned barcode here
      print("Scanned: $value");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddItemPage(),
          settings: RouteSettings(arguments: value),
        ),
      );
    });
  break;

            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventoryPage()),
              );
              break;
            default:
            // Handle invalid index
          }
        },
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
