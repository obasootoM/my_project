import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_project/common/widget/custom_button.dart';
import 'package:my_project/common/widget/custom_textfield.dart';
import 'package:my_project/constant/utilis.dart';

import '../../../constant/global_variablee.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController = TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final TextEditingController _quantityEditingController = TextEditingController();
  List<File> images = [];
  void pickImage() async{
    var res = await pickFile();
    setState(() {
      images = res;
    });
  }
  @override
  void dispose() {
    super.dispose();
    _productEditingController.dispose();
    _descriptionEditingController.dispose();
    _priceEditingController.dispose();
    _quantityEditingController.dispose();

  }
  String category = 'Mobile';
  List<String> productCategory = [
    'Mobile',
    'Essentials',
    'Appliances',
    'Books',
    'Fashions'
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: GlobalVariable.appGradient
            ),
          ),
          title: const Text('add product',
            style: TextStyle(color: Colors.black),)

        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10,4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_open,size: 40,),
                        SizedBox(height: 15,),
                        Text('Select product images',style: TextStyle(),)
                      ],
                    ),
                  ),),
                ),
                const SizedBox(height: 30,),
                CustomTextField(controller: _productEditingController, hinText: 'product'),
                const SizedBox(height: 10,),
                CustomTextField(controller: _descriptionEditingController, hinText: 'description',maxLine: 7,),
                const SizedBox(height: 10,),
                CustomTextField(controller: _priceEditingController, hinText: 'price'),
                const SizedBox(height: 10,),
                CustomTextField(controller: _quantityEditingController, hinText: 'quantity'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                        width: double.infinity,
                        child: DropdownButton(
                          value: category,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: productCategory.map((String item) {
                            return DropdownMenuItem(child:
                              Text(item),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              category = newVal!;
                            });
                          },
                        ),),),
                const SizedBox(height: 10,),
                CustomButton(hinText: 'Add', onTap: () {

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
