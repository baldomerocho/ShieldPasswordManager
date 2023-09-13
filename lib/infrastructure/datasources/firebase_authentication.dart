import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthentication {
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Check if user canceled the login
      if (googleUser == null) {
        return Future.error("Login canceled by user");
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      throw Exception("Error during sign in with Google: $error");
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signInWithApple() async {
    try{
      AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print(credential);

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

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
    signOut() ;
  }

  Future<bool> hasSession() async {
    return FirebaseAuth.instance.currentUser != null;
  }
}
