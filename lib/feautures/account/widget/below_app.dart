import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/provider/user_provvider.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration:  const BoxDecoration(
        gradient: GlobalVariable.appGradient,
      ),
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Row(
        children: [
          RichText(
            text:  TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: _user.Name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  )
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}

