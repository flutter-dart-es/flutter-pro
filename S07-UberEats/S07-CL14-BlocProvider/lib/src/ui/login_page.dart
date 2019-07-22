import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutteruberfood/src/blocs/login_bloc.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';

class LoginPage extends StatelessWidget {
  LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LoginBloc>(context);

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
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder: (BuildContext ctx, AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.hasData) {
          return Container();
        } else {
          return SignInButton(
            Buttons.Google,
            text: "Iniciar sesión Google",
            onPressed: () {
              bloc.googleSignIn();
            },
          );
        }
      }
    );

  }
}
