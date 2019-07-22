import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/src/ui/movie_list.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Películas')),
        body: MovieList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.movie),
        ),
      ),
    );
  }

}
