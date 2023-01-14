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
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // 메인 컬러
                onPrimary: Colors.black, // 애니메이션 효과의 색상
                shadowColor: Colors.black, // 그림자
                elevation: 10.0, // 그림자를 더! Z방향으로 더 튀어나오게.
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                padding: EdgeInsets.all(32.0),
              ),
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
