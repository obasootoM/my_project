import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/feautures/home/screen/category_screen.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});
  void navigatorScreen(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemExtent: 80,
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariable.categoryImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigatorScreen(context, GlobalVariable.categoryImages[index]['title']!),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        GlobalVariable.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    GlobalVariable.categoryImages[index]['title']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            );
          }),
    );
  }
}
