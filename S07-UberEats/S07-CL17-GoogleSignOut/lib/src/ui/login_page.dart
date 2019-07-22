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
              colorFilter: ColorFilter.mode(Color.fromARGB(100, 0, 0, 0), BlendMode.darken)
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
    return StreamBuilder(
      stream: bloc.googleAccount,
      builder: (BuildContext ctx, AsyncSnapshot<FirebaseUser> snapshot) {
        if(!snapshot.hasData) { // Si no se ha hecho login
          return Container();
        } else {
          return Column(
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: new NetworkImage(snapshot.data.photoUrl.toString()),
                      fit: BoxFit.fill
                  )
                ),
                margin: EdgeInsets.only(bottom: 10.0),
              ),
              Text(
                "Hola, ${snapshot.data.displayName.toString()}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                width: double.infinity, // que ocupe todo el ancho del padre
                child: RaisedButton(
                  child: Text('Entrar'),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {

                  },
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              SizedBox(
                  width: double.infinity, // que ocupe todo el ancho del padre
                  child: RaisedButton(
                    child: Text('Cerrar sesión'),
                    color: Colors.grey,
                    textColor: Colors.white,
                    onPressed: () {
                      bloc.googleSignOut();
                    },
                  )
              ),

            ],
          );
        }
      }

    );
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
