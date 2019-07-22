import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutteruberfood/src/resources/firebase_provider.dart';

class FirebaseRepository {
  final _provider = FirebaseProvider();

  // Firebase Authentication

  Future<FirebaseUser> googleSignIn() async => _provider.googleSignIn();

  Future<void> googleSignOut() async => _provider.googleSignOut();

  // Cloud Firestore

  Stream<QuerySnapshot> getRestaurantes() => _provider.getRestaurantes();
}