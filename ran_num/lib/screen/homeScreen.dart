import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TestWidget(label: 'test1'),
          const TestWidget(label: 'test2'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // setState를 통해 build가 다시 실행됨
              });
            },
            child: Text('build!'),
          ),
        ],
      ),
    ));
  }
}

class TestWidget extends StatelessWidget {
  final String label;

  const TestWidget({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    print('$label build 실행');

    return Container(
      child: Text(label),
    );
  }
}
