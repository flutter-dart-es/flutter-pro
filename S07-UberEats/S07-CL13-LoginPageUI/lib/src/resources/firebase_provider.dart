import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider {
  GoogleSignIn _googleSignIn;
  FirebaseAuth _firebaseAuth;

  // Constructor
  FirebaseProvider() {
    _googleSignIn = GoogleSignIn();
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> googleSignIn() async {
    // Autenticación con Google (cuadro de diálogo)
    final GoogleSignInAccount googleUser = await this._googleSignIn.signIn();

    // Con la cuenta de Google seleccionada por el usuario > autenticación
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Ya tenemos la autenticación con Google. Preparamos ahora la Autenticación con Firebase
    final AuthCredential googleAuthCredential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );

    // Iniciamos sesión en Firebase Authentication
    final FirebaseUser user = await this._firebaseAuth.signInWithCredential(googleAuthCredential);

    return user;
  }

}