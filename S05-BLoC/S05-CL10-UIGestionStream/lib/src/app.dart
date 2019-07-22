import 'package:flutter/material.dart';
import 'package:pizzeria_app_bloc/src/ui/pizzeria.dart';

import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: new Pizzeria(),
      ),
    );
  }
}
