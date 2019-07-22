import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruberfood/src/resources/firebase_provider.dart';

class FirebaseRepository {
  final _provider = FirebaseProvider();

  Future<FirebaseUser> googleSignIn() async => _provider.googleSignIn();
}