import 'package:flutter/material.dart';
import 'package:pizzeria_app_bloc/src/blocs/bloc.dart';
import 'package:pizzeria_app_bloc/src/blocs/provider.dart';

class Pizzeria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Antonio's Pizza"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            menu1(_bloc),
            menu2(_bloc),
            informacionPedido(_bloc),
          ],
        ),
      ),
    );
  }

  menu1(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
                child: Text('Napolitana'),
                onPressed: () {
                  bloc.nuevoPedido("Napolitana");
                }
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: RaisedButton(
                child: Text('California Style'),
                onPressed: () {
                  bloc.nuevoPedido("California");
                }
            ),
          )
        ],
      ),
    );
  }

  menu2(Bloc bloc) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
                child: Text('Sushi'),
                onPressed: () {
                  bloc.nuevoPedido("Sushi");
                }
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
          ),
          Expanded(
            child: RaisedButton(
                child: Text('Marinara'),
                onPressed: () {
                  bloc.nuevoPedido("Marinara");
                }
            ),
          )
        ],
      ),
    );
  }

  informacionPedido(Bloc bloc) {
    return Container();
  }
}
