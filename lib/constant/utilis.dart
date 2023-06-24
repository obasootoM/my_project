import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<List<File>> pickFile() async{
        List<File> image = [];
        try{
          var file = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.image
          );

          if (file != null && file.files.isNotEmpty) {
            for (int i = 0; i< file.files.length; i++) {
              image.add(File(file.files[i].path!));
            }
          }

        }catch(e){
               debugPrint(e.toString());
        }
        return image;
}