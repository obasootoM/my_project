import 'package:flutter/material.dart';


class Deal extends StatelessWidget {
  const Deal({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10,top: 5),
          child: const Text('Deal of the Day', style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1647782434770-dbe06fc5bba6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWxpZW53YXJlJTIwcGN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
          height: 255,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15),
          child: const Text('\$100000',
            style: TextStyle(fontSize: 18),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15,top: 5,right: 40),
          child: const Text('Sooto',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Image.network('https://images.unsplash.com/photo-1640955014216-75201056c829?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YWxpZW53YXJlJTIwcGN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                    height: 100,
                  ),
                 Image.network('https://images.unsplash.com/photo-1610018556010-6a11691bc905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YWxpZW53YXJlJTIwcGN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.fitWidth,
                  width: 100,
                   height: 100,
                 ),
                 Image.network('https://images.unsplash.com/photo-1593640408182-31c70c8268f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGFsaWVud2FyZSUyMHBjfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                 fit: BoxFit.fitWidth,
                 width: 100,
                   height: 100,
                ),
                Image.network('https://images.unsplash.com/photo-1625842268584-8f3296236761?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGFsaWVud2FyZSUyMHBjfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                  height: 100,
               ),
               Image.network('https://images.unsplash.com/photo-1610018556010-6a11691bc905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YWxpZW53YXJlJTIwcGN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: const Text('See More Deals', style: TextStyle(
             color: Colors.cyan
          ),),
        )
      ],
    );
  }
}
