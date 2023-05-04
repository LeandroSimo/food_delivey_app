import 'package:firebase_auth/firebase_auth.dart';

abstract class IBaseAuthRepository {
  Stream<User?> get authStateChanges;

  createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required Function(UserCredential user) thenValue});
  signInWithEmailAndPassword(
      {required String email,
      required String password,
      required Function(UserCredential user) thenValue});
  signOut();
  singInWithGoogle();
}
