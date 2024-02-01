import 'package:flutter/material.dart';
import 'package:todo_appwrite/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Icon(
                Icons.login_sharp,
                size: 100,
              ),
              const SizedBox(height: 100),
              TextFormField(
                controller: emailTextController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: passwordTextController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  loginUser(
                    emailTextController.text,
                    passwordTextController.text,
                  ).then((value) {
                    if (value == 'success') {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(value),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login', style: TextStyle(fontSize: 15)),
              ),
              const SizedBox(height: 5),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Register', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
