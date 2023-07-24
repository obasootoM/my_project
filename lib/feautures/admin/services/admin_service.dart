import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constant/error_handling.dart';
import 'package:my_project/constant/utilis.dart';
import 'package:my_project/model/product.dart';

import 'package:provider/provider.dart';

import '../../../constant/global_variablee.dart';
import 'package:http/http.dart' as http;

import '../../../provider/user_provvider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
        id: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        body: product.toJson(),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.Token
        },
      );

      HttpResponseService(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product Added Successfully!');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchProduct(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> list = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-product'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.Token
      });
      HttpResponseService(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              list.add(Product.fromJson(jsonEncode(
                  jsonDecode(res.body)[i]))); // fromjson decode it from json
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return list;
  }

  void deleteProduct({
    required BuildContext context,
    required VoidCallback onSuccess,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    try {
      http.Response res =
          await http.delete(Uri.parse('$uri/admin/delete-product'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.Token
      },
      body: jsonEncode(
        {
          "id": product.id
        }
      )
      );
      HttpResponseService(
          response: res,
          context: context,
          onSuccess: onSuccess);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
