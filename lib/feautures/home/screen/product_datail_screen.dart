import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-screen';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 3.0,
          flexibleSpace: Container(
            ),
          )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(child: Text('hello world'))
            ]),
    );
  }
}
