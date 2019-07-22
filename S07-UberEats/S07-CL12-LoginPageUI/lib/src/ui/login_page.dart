import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UberEats'),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new NetworkImage('http://www.minitwitter.com/resources/ubereats_bike.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color.fromARGB(70, 0, 0, 0), BlendMode.darken)
          )
        ),
        child: _drawLoginForm(context),
      )

    );
  }

  _drawLoginForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildUserInfo(context),
          _buildSignInButton(context)
        ],
      ),
    );
  }

  _buildUserInfo(BuildContext context) {
    return Container();
  }

  _buildSignInButton(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Sign up with Google",
      onPressed: () {},
    );
  }
}
