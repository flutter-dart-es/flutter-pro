import 'package:flutteruberfood/src/models/restaurante.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';
import 'package:flutteruberfood/src/resources/firebase_repository.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantesBloc extends BlocBase {
  FirebaseRepository _repository;

  // Listado de restaurantes actuales
  List<Restaurante> _auxRestaurantes = List<Restaurante>();

  // StreamController
  BehaviorSubject<List<Restaurante>> _restaurantesController = BehaviorSubject<List<Restaurante>>();

  // in >>>> sink
  Sink<List<Restaurante>> get _inRestaurantes => _restaurantesController.sink;

  // out >>> stream
  Stream<List<Restaurante>> get outRestaurantes => _restaurantesController.stream;

  // Constructor
  RestaurantesBloc() {
    _repository = FirebaseRepository();

    _repository.getRestaurantes().listen((snapshotColeccionRestaurantes) {
        _auxRestaurantes.clear();

        snapshotColeccionRestaurantes.documents.forEach((snapshotRestaurante) {
          Restaurante r = Restaurante.fromSnapshot(snapshotRestaurante);
          _auxRestaurantes.add(r);
        });

        _inRestaurantes.add(_auxRestaurantes);

    });

  }

  @override
  void dispose() {
    _inRestaurantes.close();
    _restaurantesController.close();
  }

}