import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ); //기본값은 현재 날짜로 받아옴
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed(),
              ),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    final DateTime now = DateTime.now();

    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              //initialDateTime: selectedDate,
              //maximumDate: DateTime(now.year, now.month, now.day),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
                ;
              },
            ),
          ),
        );
      },
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/image/middle_image.png'));
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: TextStyle(
                color: Colors.white, fontFamily: 'parisienne', fontSize: 80),
          ),
          Text(
            '우리 처음 만난 날',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 30,
            ),
          ),
          Text(
            '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 20,
            ),
          ),
          IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
