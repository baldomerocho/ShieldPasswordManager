import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

class FirebaseAuthentication {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser?.authentication == null) {
        throw Exception("Login canceled by user");
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      OAuthCredential? credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      throw Exception("Error during sign in with Google: $error");
    } catch (error) {
      throw Exception("Error during sign in with Google: $error");
    }
  }
  Future<UserCredential> signInWithApple() async {
    try{
      AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');

      AuthCredential credentialApple = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      return await FirebaseAuth.instance.signInWithCredential(credentialApple);
    } catch (error) {
      throw Exception("Error during sign in with Apple: $error");
    }

  }
  Future<UserCredential> signInWithTwitter() async {
    try{
      final twitterLogin = TwitterLogin(
          apiKey: '1xC4VzWB3asMsNRwnMGXXLAhj',
          apiSecretKey:'OiA9UI5aPBh8FLgXddnrG1Orfks3P9hVcS3kqUhgyIkvJ8yv6d',
          redirectURI: 'ptf://'
      );

      final authResult = await twitterLogin.login();

      // Create a credential from the access token
      final twitterAuthCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );
      return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    } catch (error) {
      throw Exception("Error during sign in with Twitter: $error");
    }

  }
  Future<UserCredential> signInWithEmail(String email, String password) async {
      try {
        return await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        return Future.error(e.message!);

      } catch (e) {
        return Future.error(e.toString());
      }

  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
    signOut() ;
  }

  Future<bool> hasSession() async {
    return FirebaseAuth.instance.currentUser != null;
  }
}
