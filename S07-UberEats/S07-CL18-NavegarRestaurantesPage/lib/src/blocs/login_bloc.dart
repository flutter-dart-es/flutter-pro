import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruberfood/src/resources/bloc_provider.dart';
import 'package:flutteruberfood/src/resources/firebase_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc implements BlocBase {
  FirebaseRepository _repository;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // StreamController
  final BehaviorSubject<FirebaseUser> _google = BehaviorSubject<FirebaseUser>();

  // Stream
  Stream<FirebaseUser> get googleAccount => _google.stream;

  // Constructor
  LoginBloc() {
    _repository = FirebaseRepository();

    // Detectamos inicialmente si el usuario inició sesión previamente
    _firebaseAuth.currentUser().then((FirebaseUser user) {
      _google.sink.add(user);
    });
  }

  // Google Sign-In
  googleSignIn() async {
    _repository.googleSignIn().then((FirebaseUser authUser) {
      _google.sink.add(authUser);
    });
  }

  // Google + Firebase Auth: cierre de sesión
  googleSignOut() async {
    _repository.googleSignOut().then(_google.sink.add);
  }

  dispose() {
    _google.close();
  }


}