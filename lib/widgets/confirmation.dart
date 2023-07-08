import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:scanpro/screens/inventory.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  static const String routName = "/confirmation-page";

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets5.lottiefiles.com/packages/lf20_npzyxtd5.json",
              controller: _controller, onLoaded: (compos) {
            _controller
              ..duration = compos.duration
              ..forward().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InventoryPage()));
              });
          }),
          const Center(child: Text("Product Added Successfully")),
        ],
      ),
    );
  }
}
