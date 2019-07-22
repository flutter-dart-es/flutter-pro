import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruberfood/src/resources/firebase_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  FirebaseRepository _repository;

  // StreamController
  final BehaviorSubject<FirebaseUser> _google = BehaviorSubject<FirebaseUser>();

  // Stream
  Stream<FirebaseUser> get googleAccount => _google.stream;

  // Constructor
  LoginBloc() {
    _repository = FirebaseRepository();
  }

  // Google Sign-In
  googleSignIn() async {
    _repository.googleSignIn().then((FirebaseUser authUser) {
      _google.sink.add(authUser);
    });
  }

  dispose() {
    _google.close();
  }


}