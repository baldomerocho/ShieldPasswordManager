import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';
import 'package:ptf/infrastructure/datasources/firebase_authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  FirebaseAuthentication firebaseAuthentication;
  AuthenticationRepositoryImpl(this.firebaseAuthentication);
  @override
  Future<UserCredential?> signInWithGoogle() => firebaseAuthentication.signInWithGoogle();

  @override
  Future<UserCredential?> signInWithApple() => firebaseAuthentication.signInWithApple();

  @override
  Future<UserCredential?> signInWithEmail({required String email, required String password})  => firebaseAuthentication.signInWithEmail(email,password);

  @override
  Future<void> signOut() => firebaseAuthentication.signOut();

  @override
  Future<void> delete() => firebaseAuthentication.deleteUser();

  @override
  Future<UserCredential?> signInWithTwitter() => firebaseAuthentication.signInWithTwitter();

  @override
  Future<bool> hasSession() => firebaseAuthentication.hasSession();
}