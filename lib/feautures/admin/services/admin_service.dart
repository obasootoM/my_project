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





class AdminService{

  void sellProduct ({
   required BuildContext context,
   required String name,
   required String description,
   required double price,
   required double quantity,
   required String category,
   required List<File> images

}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try{
      final cloudiary =  CloudinaryPublic('dmaa1jmon','oigrqbfj');
       List<File> imageUrl = [];
      for (int i=0; i<images.length; i++) {
        CloudinaryResponse response = await cloudiary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name)
        );
        imageUrl.add(response.secureUrl as File);
      };
      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imageUrl);
     http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
        body: product.toJson(),
        headers: {
        'Content Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.Token,
        }
      );
      HttpResponseService(
          response: res, 
          context: context, 
          onSuccess: (){
            showSnackBar(context, 'product added successfully');
            Navigator.pop(context);
          });
    }catch(e) {
         showSnackBar(context, e.toString());
    }
  }
}