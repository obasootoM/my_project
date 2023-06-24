import 'package:flutter/material.dart';
import 'package:my_project/common/widget/custom_button.dart';
import 'package:my_project/common/widget/custom_textfield.dart';
import 'package:my_project/constant/global_variablee.dart';
import 'package:my_project/feautures/auth/services/auth_service.dart';

enum Auth {
   SignIn,
   SignUp,
}
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth = Auth.SignUp;
  final _signupForm = GlobalKey<FormState>();
  final _signinForm = GlobalKey<FormState>();
  final authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passWordController.dispose();
  }
  void signUpUser() {
    authService.SignUpUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passWordController.text);
  }
  void signInUser() {
    authService.SignInUser(
        context: context,
        email: _emailController.text,
        password: _passWordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   const Text("Welcome", style:
                   TextStyle(fontSize: 20,
                             fontWeight: FontWeight.bold),
                   ),
                ListTile(
                  tileColor: _auth == Auth.SignUp ?
                  GlobalVariable.backgroundColor:
                  GlobalVariable.greyBackground,
                  title:
                  const Text("create Account",
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor,
                    value: Auth.SignUp,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.SignUp)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      key: _signupForm,
                      child: Column(
                          children: [
                            CustomTextField(controller: _nameController, hinText: 'Name',),
                            const SizedBox(height: 8,),
                            CustomTextField(controller: _emailController, hinText: 'Email', ),
                            const SizedBox(height: 8,),
                            CustomTextField(controller: _passWordController, hinText: 'Password',),
                            const SizedBox(height: 8,),
                            CustomButton(hinText: "sign up", onTap: () {
                                   if (_signupForm.currentState!.validate()) {
                                     signUpUser();
                                   }
                            })
                          ],
                      ),
                    ),
                  ),

                ListTile(
                  tileColor: _auth == Auth.SignIn ?
                  GlobalVariable.backgroundColor:
                  GlobalVariable.greyBackground,
                  title:
                  const Text("Sign-In",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                  leading: Radio(
                    activeColor: GlobalVariable.secondaryColor,
                    value: Auth.SignIn,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.SignIn)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariable.backgroundColor,
                    child: Form(
                      key: _signinForm,
                      child: Column(
                        children: [
                          CustomTextField(controller: _emailController, hinText: 'Email', ),
                          const SizedBox(height: 10,),
                          CustomTextField(controller: _passWordController, hinText: 'Password',),
                          const SizedBox(height: 10,),
                          CustomButton(hinText: "sign In", onTap: () {
                            if (_signinForm.currentState!.validate()) {
                              signInUser();
                            }
                          })
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
