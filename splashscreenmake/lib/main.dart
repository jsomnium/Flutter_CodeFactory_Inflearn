import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 안보이게
      home: HomeSreen(),
    ),
  );
}

class HomeSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff99231),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('asset/img/logo.png'),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

// 핫 리로드 -> 빌드함수에 있는 코드만 실행한다