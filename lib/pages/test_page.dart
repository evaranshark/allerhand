import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TestPage extends StatelessWidget {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            Container(
              width: 500,
              height: 500,
              color: Colors.orange,
            ),
            Container(
              width: 500,
              height: 500,
              color: Colors.red,
            ),
            Container(
              width: 500,
              height: 500,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
