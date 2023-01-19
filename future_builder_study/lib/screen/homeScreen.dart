import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'FutureBuilder',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'ConState : ${snapshot.connectionState}',
              ),
              Text(
                'Data : ${snapshot.data}',
              ),
              Text(
                'Error : ${snapshot.error}',
              )
            ],
          );
        },
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(
      Duration(seconds: 3),
    );

    final random = Random();

    return random.nextInt(100);
  }
}
