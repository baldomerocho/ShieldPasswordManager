
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ptf/domain/repositories/authentication_repository.dart';
import 'package:ptf/presentation/blocs/authentication/authentication_provider.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationRepository repository;
  AuthenticationBloc({required this.repository}) : super(const AuthenticationState.initial()) {
    on<_NewLoginEvent>((event, emit) async {
      emit(const AuthenticationState.loading());
      switch (event.provider) {
        case AuthenticationProvider.google:
         try {
           await repository.signInWithGoogle();
           emit(const AuthenticationState.success());
          } catch (error) {
            if (error.toString() == "Login canceled by user") {
              emit(const AuthenticationState.canceled());
              await Future.delayed(const Duration(seconds: 2));
              emit(const AuthenticationState.initial());
            } else {
              emit(AuthenticationState.failure(error.toString()));
            }
         }

          break;
        case AuthenticationProvider.apple:
          try {
            await repository.signInWithApple();
            emit(const AuthenticationState.success());
          } catch (error) {
            if (error.toString() == "Login canceled by user") {
              emit(const AuthenticationState.canceled());
            } else {
              emit(AuthenticationState.failure(error.toString()));
            }
          }
          break;
        case AuthenticationProvider.email:
          try{
            await repository.signInWithEmail(email: event.credentials!.email, password: event.credentials!.password);
            emit(const AuthenticationState.success());
          } on FirebaseAuthException catch (error) {
            emit(AuthenticationState.failure(error.toString()));
          } catch (error) {
            emit(AuthenticationState.failure(error.toString()));
          }
          break;

        case AuthenticationProvider.twitter:
          try {
            await repository.signInWithTwitter();
            emit(const AuthenticationState.success());
          } catch (error) {
            if (error.toString() == "Login canceled by user") {
              emit(const AuthenticationState.canceled());
            } else {
              emit(AuthenticationState.failure(error.toString()));
            }
          }
          break;
      }
    });

    on<_NewLogoutEvent>((event, emit) async {
      emit(const AuthenticationState.loading());
      await repository.signOut();
      emit(const AuthenticationState.initial());
    });
  }
}
