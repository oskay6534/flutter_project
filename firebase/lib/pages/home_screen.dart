import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () async {
            await auth.signOut();
          }, child: Text("Cikis Yap"))
        ],
        title: Center(child: const Text('Home Screen')),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}