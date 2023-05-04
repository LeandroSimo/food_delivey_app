import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/data/service/auth/i_base_auth_repositories.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAutentication implements IBaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAutentication({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required Function(UserCredential user) thenValue}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(thenValue);
    } catch (_) {}
  }

  @override
  signInWithEmailAndPassword({
    required String email,
    required String password,
    required Function(UserCredential user) thenValue,
  }) async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(thenValue);
    } catch (_) {}
  }

  @override
  signOut() {
    _firebaseAuth.signOut();
  }

  @override
  singInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await _firebaseAuth.signInWithCredential(credential);
  }
}
