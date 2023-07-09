import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String mrp;
  final String weight;

  static const routName = '/details-page';

  ProductDetailsPage({
    required this.productName,
    required this.mrp,
    required this.weight,
  });

  static const String routeName = "/product-details"; // Add the route name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(productName[0]),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'Product Name: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'Product Price: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  mrp,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Text(
                  'Product Weight/Size: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  weight,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
