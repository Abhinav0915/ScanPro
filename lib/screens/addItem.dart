import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanpro/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  static const routName = '/addItem-page';

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  String productName = '';
  String mrp = '';
  String weight = '';
  String description = '';

  File? _image;
  String? barcode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    barcode = ModalRoute.of(context)?.settings.arguments as String?;
  }

  Future getImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Build Product Folio",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Name",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      productName = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Product Name",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("MRP",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              mrp = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter MRP",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                            contentPadding: const EdgeInsets.only(left: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Weight/Size",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  weight = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Weight/Size",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                                contentPadding: const EdgeInsets.only(left: 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Images",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImagePicker();
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        strokeWidth: 1,
                        dashPattern: [3, 3],
                        color: Colors.blue,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _image != null
                              ? Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.add_circled,
                                          size: 30,
                                          color: Colors.blue.shade700,
                                        ),
                                        Text(
                                          "Add Images",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                "Product Description",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Product Description",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await products.doc(barcode).set({
                      'name': productName,
                      'mrp': mrp,
                      'weight': weight,
                      'description': description,
                      'image': _image.toString(),
                    }).then((value) =>
                        Navigator.pushNamed(context, '/confirmation-page'));
                  },
                  child: const Text(
                    "Save & Next",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
