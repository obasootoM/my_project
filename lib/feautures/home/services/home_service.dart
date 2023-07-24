import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_project/constant/error_handling.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/constant/utilis.dart';
import 'package:my_project/model/product.dart';
import 'package:my_project/provider/user_provvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeServices{
  Future<List<Product>> fetchProductCategory( {required BuildContext context,required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> list = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-product?category=$category'), headers: {
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

}