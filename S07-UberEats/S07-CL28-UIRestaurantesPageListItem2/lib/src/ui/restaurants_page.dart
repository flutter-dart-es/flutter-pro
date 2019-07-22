import 'package:flutter/material.dart';
import 'package:flutteruberfood/src/blocs/restaurantes_bloc.dart';
import 'package:flutteruberfood/src/models/restaurante.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';

class RestaurantsPage extends StatelessWidget {
  RestaurantesBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<RestaurantesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: Center(
        child: StreamBuilder<List<Restaurante>>(
          stream: bloc.outRestaurantes,
          builder: (BuildContext ctx, AsyncSnapshot<List<Restaurante>> snapshot){
            if(snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(5.0),
                child: ListView(
                  children: snapshot.data.map((Restaurante r){
                    return _buildRestaurantCard(context, r);
                  }).toList(),
                ),
              );
            }

            return Container(
                child: Text('Cargando...')
            );
          },
        )
      )
    );

  }

  Widget _buildRestaurantCard(BuildContext context, Restaurante r) {
    return SizedBox(
      height: 150,
      child: new GestureDetector(
        onTap: (){
          //TODO: evento click en restaurante
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: new DecorationImage(
                  image: new NetworkImage(r.photourl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Color.fromARGB(100, 0, 0, 0), BlendMode.hardLight)
              )
            ),
            child: new Stack(
              children: <Widget>[
                new SizedBox( // Titulo y subtitulo
                  width: double.infinity, // todo el ancho
                  child: Padding(padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          r.titulo,
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          r.subtitulo,
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, bottom: 3.0),
                      child: Text(
                        '${r.precioTransporte.toString()} €',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                        ),
                      )
                  )
                ],
              ),
            ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, bottom: 3.0),
                        child: Text(
                          r.direccion,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                          ),
                        )
                      )
                    ],
                  ),
                )
              ],
            )
          )
        )
      ),
    );
  }
}
