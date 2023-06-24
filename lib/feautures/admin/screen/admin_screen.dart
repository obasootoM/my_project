import 'package:flutter/material.dart';
import 'package:my_project/feautures/admin/screen/posts_screen.dart';
import '../../../constant/global_variablee.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomNavigator = 42;
  double  bottomNavigatorBorderBarWidth = 5;
  void changePage(int page) {
    setState(() {
      _page = page;
    });
  }
  List<Widget> page = [
    const PostScreen(),
    const Center(
      child: Text('Analytics Page'),
    ),
    const Center(
      child: Text('Cart Page'),
    ),
  ];
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
             const Text('Admin',style: TextStyle(fontWeight: FontWeight.bold,
               color: Colors.black
             ),)
            ],
          ),
        ),
      ),
      body: page[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.selectiveNavBarColor,
        unselectedItemColor: GlobalVariable.unSelectiveNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: changePage,
        items: [
          //Posts
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
          //Analytics Page
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
            child: const Icon(Icons.analytics_outlined),
          ),
              label: ""
          ),
          //Cart Page
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
            child: const Icon(Icons.all_inbox_outlined),
          ),
              label: ""
          ),
        ],
      ),
    );
  }
}
