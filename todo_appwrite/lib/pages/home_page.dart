import 'package:flutter/material.dart';
import 'package:todo_appwrite/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            onPressed: () {
              logoutUser();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout_sharp),
          )
        ],
      ),
      body: Center(
        child: Text('Welcome $account'),
      ),
    );
  }
}
