import 'package:flutter/material.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/feautures/admin/screen/admin_screen.dart';
import 'package:my_project/feautures/auth/screens/auth_screen.dart';
import 'package:my_project/feautures/auth/services/auth_service.dart';
import 'package:my_project/feautures/home/screen/home_screen.dart';
import 'package:my_project/provider/user_provvider.dart';
import 'package:my_project/route.dart';
import 'package:provider/provider.dart';

import 'feautures/auth/widgets/bottom.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(
          create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final AuthService _authService = AuthService();

@override
void initState() {
  super.initState();
  _authService.getUserData(context: context);
}

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Amazon clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariable.secondaryColor
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black
            )
          )
        ),
        onGenerateRoute: (setting) => generateRoute(setting),
        home:
        // Provider.of<UserProvider>(context).user.Token.isNotEmpty?
        //     Provider.of<UserProvider>(context).user.Type == 'user'
        //         ? const BottomBar()
               const AdminScreen());
        //     :const AuthScreen());
  }
}