import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              _TopPart(),
              _BottomPart(),
            ],
          ),
        ),
      ),
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
  const _TopPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            '2021.12.27',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 20,
            ),
          ),
          IconButton(
            iconSize: 60,
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
          ),
          Text(
            'D+1',
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
