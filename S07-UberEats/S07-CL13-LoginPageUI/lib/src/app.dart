import 'package:flutter/material.dart';
import 'package:flutteruberfood/src/ui/login_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UberEats',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Regencie'
      ),
      home: LoginPage()
    );
  }
}