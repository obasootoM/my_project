import 'package:flutter/material.dart';
import 'package:my_project/feautures/home/widget/additional_box.dart';
import 'package:my_project/feautures/home/widget/carousal_image.dart';
import 'package:my_project/feautures/home/widget/deal_of_day.dart';
import 'package:my_project/feautures/home/widget/product_cart.dart';
import 'package:my_project/provider/user_provvider.dart';
import 'package:provider/provider.dart';

import '../../../constant/global_variablee.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return  Scaffold(appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: GlobalVariable.appGradient
          ),
        ),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(left: 15,),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: InkWell(
                        child: Padding(padding:  EdgeInsets.only(left: 6),
                        child: Icon(Icons.search, color: Colors.black,size: 23,),
                        ),

                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:  EdgeInsets.only(top: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Colors.black, width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none
                      ),
                      hintText: 'Search Amazon.in',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      )
                    ),
                  ),
                )
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 10,),
              child: const Icon(Icons.mic, color: Colors.black, size: 24,),
            )

          ],
        ),
      ),
    ),
      body:  const SingleChildScrollView(
        child:  Column(
          children: [
            AdditionalBox(),
            SizedBox(height: 10,),
            ProductCart(),
            SizedBox(height: 10,),
            CarousalImages(),
            SizedBox(height: 10,),
            Deal()
          ],
        ),
      ),
    );
  }
}

