import 'package:allerhand_test/my_router_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AllerhandTestApp());
}

class AllerhandTestApp extends StatelessWidget {
  const AllerhandTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return CupertinoApp.router(
      title: "Allerhand",
      theme: const CupertinoThemeData(
        primaryColor: Color.fromARGB(255, 46, 64, 131),
        brightness: Brightness.light,
      ),
      routerDelegate: MyRouterDelegate(),
    );
  }
}
