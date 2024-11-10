import 'package:flutter/material.dart';
import 'package:syria_meds/core/routing/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login Screen"),),
      body:  Center(
        child:  TextButton(child:const  Text("Login screen"),
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.layoutScreen);
        },),
      ),
    );
  }
}
