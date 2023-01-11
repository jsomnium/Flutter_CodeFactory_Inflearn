import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [
        Image.asset(
          'asset/image/image_1.jpeg',
          fit: BoxFit.cover,
        ),
        Image.asset('asset/image/image_2.jpeg'),
        Image.asset('asset/image/image_3.jpeg'),
        Image.asset('asset/image/image_4.jpeg'),
        Image.asset('asset/image/image_5.jpeg'),
      ],
    ));
  }
}
