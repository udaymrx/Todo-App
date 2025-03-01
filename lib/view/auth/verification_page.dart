import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global_provider.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {

  @override
  void initState() {
    super.initState();
    listenLogin();
  }

  void listenLogin() async {
    try {
      FirebaseDynamicLinks.instance.onLink.listen(
          (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        if (deepLink != null) {
          final user = await ref
              .read(firebaseProvider)
              .verifyEmail(email: widget.email, emailLink: deepLink.toString());
          if (user != null) {
            Navigator.pop(context);
          }
        }
      }, onError: (e) async {
        debugPrint(e.message);
      });

      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        debugPrint(deepLink.userInfo);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void checkVerification() async {
    await FirebaseAuth.instance.currentUser?.reload();

    if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            "We have sent a verification mail on your email address.\n"
            "Please click on the link provided in the email and verify yourself to proceed.",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
