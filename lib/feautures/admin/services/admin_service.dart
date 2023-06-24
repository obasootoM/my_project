import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constant/utilis.dart';
import 'package:my_project/model/product.dart';



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
    }catch(e) {
         showSnackBar(context, e.toString());
    }
  }
}