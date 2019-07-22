import 'package:flutter/material.dart';
import 'package:pizzeria_app_bloc/src/blocs/bloc.dart';
import 'package:pizzeria_app_bloc/src/blocs/provider.dart';

class Pizzeria extends StatelessWidget {
  var pizzaName = "";

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
                  pizzaName = "Napolitana";
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
                  pizzaName = "California Style";
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
                  pizzaName = "Sushi";
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
                  pizzaName = "Marinara";
                }
            ),
          )
        ],
      ),
    );
  }

  informacionPedido(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.mostradorRecogida,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if(snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                snapshot.data,
                fit: BoxFit.fill
              ),
              Container(
                margin: EdgeInsets.only(top: 8.0),
              ),
              Text("Listo! Recoge tu pizza $pizzaName")
            ],

          );
        } else if(snapshot.hasError) {
          return Column(
              children: <Widget>[
                Image.network(
                  "http://megatron.co.il/en/wp-content/uploads/sites/2/2017/11/out-of-stock.jpg",
                  fit: BoxFit.fill,
                ),
                Text(
                  snapshot.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0
                  ),
                )
              ],
          );
        }
        return Text('No pizza solicitada');
      }
    );
  }
}
