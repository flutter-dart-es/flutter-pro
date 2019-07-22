import 'dart:async';
import 'package:rxdart/rxdart.dart';


class Bloc {

  // Nuestra pizzería >>> StreamController
  final pedidos = StreamController<String>();

  // Nuestro mostrador de recogida de pedidos
  Stream<String> get mostradorRecogida => pedidos.stream.transform(validarPedido);

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

  // Esta es la función que realiza Antonio: validar si la pizza solicitada tiene stock
  // y además prepararla.

  // pedido: nombre de la pizza solicitada

  final validarPedido =
      StreamTransformer<String, String>.fromHandlers(handleData: (pedido, sink) {

        if(_pizzasList[pedido] != null) {
          if(_pizzasList[pedido] > 0) {
            sink.add(_pizzasImages[pedido]);
            final cantidad = _pizzasList[pedido];
            _pizzasList[pedido] = cantidad - 1;
          } else {
            sink.addError("No está disponible la pizza");
          }
        } else {
          // Pizza solicitada no está en el menú
          sink.addError("Pizza no encontrada");
        }

      });


  // Realiza la función de María, que es la empleada que tomas los pedidos en la Pizzería.
  void nuevoPedido(String pizza) {
    pedidos.sink.add(pizza);
  }

}