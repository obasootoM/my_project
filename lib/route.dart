import 'package:flutter/material.dart';
import 'package:my_project/feautures/admin/screen/admin_screen.dart';
import 'package:my_project/feautures/auth/screens/auth_screen.dart';
import 'package:my_project/feautures/home/screen/home_screen.dart';

import 'feautures/admin/screen/add_product.dart';
import 'feautures/auth/widgets/bottom.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case AuthScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const AuthScreen());
      case AdminScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const AdminScreen());
      case AddProduct.routeName:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const AddProduct());
      case HomeScreen.routeName:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const HomeScreen());
      case BottomBar.routeName:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const BottomBar());
      default :
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => const Scaffold(
              body:  Center(
                 child: Text("Screen does not exit yet!"),
              ),
            ));
    }

}