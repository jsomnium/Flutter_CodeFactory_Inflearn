import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버튼'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              // 튀어나온 형태의 버튼
              onPressed: () {},
              child: Text('ElevatedButton'),
            ),
            OutlinedButton(
              // 테두리만 있는 버튼
              onPressed: () {},
              child: Text('OutlinedButton'),
            ),
            TextButton(
              // 텍스트만 있는 버튼
              onPressed: () {},
              child: Text('TextButton'),
            ),
          ],
        ),
      ),
    );
  }
}
