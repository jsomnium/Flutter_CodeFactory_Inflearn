import 'dart:math';

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
  List<int> randomNumbers = [123, 456, 789];

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
              _Header(),
              _Body(randomNumbers: randomNumbers),
              _Bottom(onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 나머지 공간을 차지하도록
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers
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
    );
  }
}

class _Bottom extends StatelessWidget {
  final VoidCallback onPressed;

  const _Bottom({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: RED_COLOR),
        onPressed: () {
          final rand = Random();

          final List<int> newNumbers = [];

          while (newNumbers.length != 3) {
            final number = rand.nextInt(1000);

            newNumbers.add(number);
          }

          setState(() {
            randomNumbers = newNumbers;
          });
        },
        child: Text('생성하기'),
      ),
    );
  }
}
