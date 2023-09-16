import 'package:firebase_auth/firebase_auth.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryMock implements AuthenticationRepository {
  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> hasSession() {
    // TODO: implement hasSession
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithEmail({required String email, required String password}) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}