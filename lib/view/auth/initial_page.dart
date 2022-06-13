import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../todo/homepage.dart';
import 'signin_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
