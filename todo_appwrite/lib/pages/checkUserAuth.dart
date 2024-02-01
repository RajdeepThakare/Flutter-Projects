import 'package:flutter/material.dart';
import 'package:todo_appwrite/auth.dart';

class CheckUserAuth extends StatefulWidget {
  const CheckUserAuth({super.key});

  @override
  State<CheckUserAuth> createState() => _CheckUserAuthState();
}

class _CheckUserAuthState extends State<CheckUserAuth> {
  @override
  void initState() {
    super.initState();

    checkUserAuth().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/register');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
