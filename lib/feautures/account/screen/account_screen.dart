import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/feautures/account/widget/below_app.dart';
import 'package:my_project/feautures/account/widget/top_button.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariable.appGradient
            ),
          ),
          title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',
                  width: 140,
                  height: 45,
                  color: Colors.black,),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: const Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
            BelowAppBar(),
          SizedBox(height: 10,),
            TopButton(),
          SizedBox(height: 20,) ,
        ],
      ),
    );
  }
}
