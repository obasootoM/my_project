import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:badges/badges.dart' as badges;
import 'package:my_project/feautures/account/screen/account_screen.dart';
import 'package:my_project/feautures/home/screen/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-screen";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigator = 42;
  double bottomNavigatorBorderBarWidth = 5;

  void changePage(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> pages = [
   const HomeScreen(),
   const AccountScreen(),
   const  Center(child:  Text('Cart page'),)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectiveNavBarColor,
        unselectedItemColor: GlobalVariable.unSelectiveNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: changePage,
        items: [
             BottomNavigationBarItem(icon: Container(
               width: bottomNavigator,

               decoration: BoxDecoration(
                 border: Border(
                   top: BorderSide(
                     width: bottomNavigatorBorderBarWidth,
                     color: _page == 0 ?
                     GlobalVariable.selectiveNavBarColor:
                     GlobalVariable.backgroundColor
                   )
                 )
               ),
                   child: const Icon(Icons.home_outlined),
             ),
             label: ""
             ),
          BottomNavigationBarItem(icon: Container(
            width: bottomNavigator,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: bottomNavigatorBorderBarWidth,
                        color: _page == 1 ?
                        GlobalVariable.selectiveNavBarColor:
                        GlobalVariable.backgroundColor
                    )
                )
            ),
                child: const Icon(Icons.person_outline_outlined),
          ),
            label: ""
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomNavigator,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: bottomNavigatorBorderBarWidth,
                        color: _page == 2 ?
                        GlobalVariable.selectiveNavBarColor:
                        GlobalVariable.backgroundColor
                    )
                )
            ),
                child: const badges.Badge(
                    badgeContent: Text('3'),
                    badgeStyle: badges.BadgeStyle(
                      elevation: 0,
                      badgeColor: Colors.white,
                    ),
                    child: Icon(Icons.shopping_cart_outlined)),
          ),
          label: ""
          ),
        ],
      ),
    );
  }
}
