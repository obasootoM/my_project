// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constant/error_handling.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/constant/utilis.dart';
import 'package:my_project/feautures/admin/screen/admin_screen.dart';
import 'package:my_project/feautures/auth/widgets/bottom.dart';
import 'package:my_project/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/provider/user_provvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class AuthService {

  // ignore: non_constant_identifier_names
  void SignInUser({
    required BuildContext context,
    required String email,
    required String password,

}) async {

    try{
          http.Response res = await http.post(
          Uri.parse('$uri/api/signIn'),
          body: jsonEncode({
            'email':email,
            'password':password
          }),
          headers: <String, String> {
            'content-type':'application/json; charset=UTF-8'
          }
      );


            
            HttpResponseService(
            response: res,
            context: context,
            onSuccess: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              Provider.of<UserProvider>(context, listen: false).SetUser(res.body);
              await pref.setString("x-auth-token", jsonDecode(res.body)['token']);
              if (Provider.of<UserProvider>(context, listen: false).user.Type == 'user') {
                Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName, (route) => false);
              }
              else {
                Navigator.pushNamedAndRemoveUntil(context, AdminScreen.routeName, (route) => false);
              }
            }
              );
    }catch(e) {
       showSnackBar(context, e.toString());
    }
  }
  // ignore: non_constant_identifier_names
  void SignUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
}) async {
    try{
      User user = User(
          Id: '',
          Name: name,
          Email: email,
          Password: password,
          Address: '',
          Token: '',
          Type: '');

     http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String> {
          'content-type':'application/json; charset=UTF-8'
        }
      );
     HttpResponseService(
         response: res,
         context: context,
         onSuccess: () {
           showSnackBar(context, "Account is created Login with the same credentials");
         },
     );
    }catch(e) {
          showSnackBar(context, e.toString());

    }
  }
  //get userData
  void getUserData({
    required BuildContext context,

  }) async {
    try{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("x-auth-token");
      if(token == null) {
          preferences.setString("x-auth-token", "");
      }

     var res = await http.post(
       Uri.parse("$uri/"),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
         'x-auth-token': token!
       }
     );
      var response = jsonDecode(res.body);
      if (response == true) {
        http.Response userResp = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            }
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.SetUser(userResp.body);
      }


    }catch(e) {
      showSnackBar(context, e.toString());

    }
  }
}