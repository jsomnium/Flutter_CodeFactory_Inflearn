import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
            child: Column(
              children: [
                Container(color: Colors.red),
              ],
            ),
            color: Colors.black),
      ),
    );
  }
}
