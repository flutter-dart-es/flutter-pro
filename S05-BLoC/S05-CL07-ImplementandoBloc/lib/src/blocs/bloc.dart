import 'dart:async';
import 'package:rxdart/rxdart.dart';


class Bloc {

  // Nuestra pizzería >>> StreamController
  final pedidos = StreamController<String>();

  // Nuestro mostrador de recogida de pedidos
  Stream<String> get mostradorPedidos => pedidos.stream;

  // Menú de pizzas con el nº de pizzas disponibles
  static final _pizzasList = {
    "Sushi": 2,
    "Napolitana": 3,
    "California": 4,
    "Marinara": 1
  };

  // Imágenes de la de las pizzas
  static final _pizzasImages = {
    "Sushi": "http://pngimg.com/uploads/pizza/pizza_PNG44077.png",
    "Napolitana": "http://pngimg.com/uploads/pizza/pizza_PNG44078.png",
    "California": "http://pngimg.com/uploads/pizza/pizza_PNG44081.png",
    "Marinara": "http://pngimg.com/uploads/pizza/pizza_PNG44084.png"
  };




}