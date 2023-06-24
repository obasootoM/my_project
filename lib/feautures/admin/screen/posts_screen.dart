import 'package:flutter/material.dart';
import 'package:my_project/feautures/admin/screen/add_product.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  void changeScreen() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('products'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.black,),
        tooltip: 'Add a Product',
        onPressed: changeScreen,
        foregroundColor: Colors.greenAccent,
        backgroundColor: Colors.greenAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
