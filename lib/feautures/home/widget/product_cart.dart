import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 80,
        scrollDirection: Axis.horizontal,
          itemCount: GlobalVariable.categoryImages.length,
          itemBuilder: (context, index) {
            return  Column(
              children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:  ClipRRect(
                   borderRadius: BorderRadius.circular(5),
                  child: Image.asset(GlobalVariable.categoryImages[index]['image']!,
                  fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
                Text(GlobalVariable.categoryImages[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12
                ),
                )
              ],
            );
          }),
    );
  }
}
