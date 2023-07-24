import 'package:flutter/material.dart';
import 'package:my_project/constant/loading.dart';
import 'package:my_project/feautures/account/widget/single_product.dart';
import 'package:my_project/feautures/admin/screen/add_product.dart';
import 'package:my_project/feautures/admin/services/admin_service.dart';
import 'package:my_project/model/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final adminservice = AdminServices();

  List<Product>? products;
  void initState() {
    super.initState();
    fetchAllProduct();
  }

  void fetchAllProduct() async {
    products = await adminservice.fetchProduct(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) async {
    adminservice.deleteProduct(
        context: context,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        },
        product: product);
  }

  void changeScreen() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loading() // if the argument is true
        : Scaffold(
            //if the argument is false;
            body: GridView.builder(
              itemCount: products?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productsList = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(image: productsList.images[0]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Text(
                          productsList.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                        IconButton(
                            onPressed: () => deleteProduct(productsList, index),
                            icon: const Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              tooltip: 'Add a Product',
              onPressed: changeScreen,
              foregroundColor: Colors.greenAccent,
              backgroundColor: Colors.greenAccent,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
