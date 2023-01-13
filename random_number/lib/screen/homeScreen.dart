import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:random_number/const/color.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '랜덤 숫자 생성기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: RED_COLOR,
                    ),
                  )
                ],
              ),
              Expanded(
                // 나머지 공간을 차지하도록
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [123, 456, 789]
                      .asMap()
                      .entries
                      .map(
                        (x) => Padding(
                          padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16),
                          child: Row(
                            children: x.value
                                .toString()
                                .split('')
                                .map((y) => Image.asset(
                                      'asset/img/$y.png',
                                      height: 70,
                                      width: 50,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: RED_COLOR),
                  onPressed: () {},
                  child: Text('생성하기'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
