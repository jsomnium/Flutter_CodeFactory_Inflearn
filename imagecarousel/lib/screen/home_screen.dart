import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Timer? timer;
  PageController controller =
      PageController(initialPage: 0 // 맨 처음 시작할 때 몇 번째 페이지부터 시작하는지
          );

  @override
  void initState() {
    // initState의 변경된 사항을 확인하려면 재시작을 해주어야 함
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0; // 마지막 이미지에 도달했을 떄 다시 돌아오도록
      }

      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    // State가 죽을 때 실행되는 함수
    // super.dispose()를 하면 사라지기 때문에 위에 코드 작성
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  } // State가 사라지면 Timer도 작동하지 않도록 해서 메모리 낭비를 줄여줌

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) =>
                  Image.asset('asset/image/image_$e.jpeg', fit: BoxFit.cover),
            )
            .toList(),
      ),
    );
  }
}
