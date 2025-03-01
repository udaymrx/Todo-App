import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithLink(String email) async {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: "https://gnicetodo.page.link",
      androidPackageName: "com.gione.nicetodo",
      handleCodeInApp: true,
      iOSBundleId: "com.gione.nicetodo",
      androidInstallApp: false,
      androidMinimumVersion: "1",
    );

    try {
      await auth.sendSignInLinkToEmail(
          email: email, actionCodeSettings: actionCodeSettings);
      debugPrint('Successfully sent email verification');
    } catch (e) {
      debugPrint('Error sending email verification $e');
    }
  }

  Future<User?> verifyEmail(
      {required String email, required String emailLink}) async {
    // Confirm the link is a sign-in with email link.
    if (FirebaseAuth.instance.isSignInWithEmailLink(emailLink)) {
      // The client SDK will parse the code from the link for you.
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailLink(email: email, emailLink: emailLink);

      // You can access the new user via userCredential.user.
      debugPrint('Successfully signed in with email link!');

      return userCredential.user;
    } else {
      return null;
    }
  }

  Future<void> reAuth(
      {required String email, required String emailLink}) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailLink(email: email, emailLink: emailLink);
    try {
      await FirebaseAuth.instance.currentUser
          ?.reauthenticateWithCredential(userCredential.credential!);
    } catch (error) {
      debugPrint("Error reauthenticating credential.");
    }
  }

  Future<void> googleLogin() async {
    final googleUser = await googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    await auth.signInWithCredential(credential);
  }

  Future<void> logOut() async {
    final isGoogle = await googleSignIn.isSignedIn();

    if (isGoogle) {
      await googleSignIn.disconnect();
    }
    await auth.signOut();
  }
}
