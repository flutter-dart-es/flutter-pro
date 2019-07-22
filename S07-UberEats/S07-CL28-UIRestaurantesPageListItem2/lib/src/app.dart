import 'package:flutter/material.dart';
import 'package:flutteruberfood/src/blocs/login_bloc.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';
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
      home: BlocProvider<LoginBloc> (
        bloc: LoginBloc(),
        child: LoginPage(),
      )
    );
  }
}