import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository{
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithApple();
  Future<UserCredential> signInWithTwitter();
  Future<UserCredential> signInWithEmail({required String email, required String password});
  Future<void> signOut();
  Future<void> delete();
  Future<bool> hasSession();
}