import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nicetodo/global_provider.dart';
import 'package:nicetodo/util/text_validation/text_validation.dart';
import 'package:nicetodo/view/widgets/loading_dialog.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  String email = "";

  final _formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    if (_formKey.currentState!.validate()) {
      showLoading(context);
      await ref.read(firebaseProvider).signInWithLink(email);
      Navigator.pop(context);
      showMessage(
        context,
        message: "We have sent a verification mail on your email address.\n"
            "Please click on the link provided in the email and verify yourself to proceed.",
      );
      listenLogin();
    }
  }

  Future<void> googleLogin() async {
    await ref.read(firebaseProvider).googleLogin();
  }

  void listenLogin() async {
    try {
      FirebaseDynamicLinks.instance.onLink.listen(
          (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        if (deepLink != null) {
          final user = await ref
              .read(firebaseProvider)
              .verifyEmail(email: email, emailLink: deepLink.toString());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              RichText(
                  text: const TextSpan(
                      text: "Welcome To\n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                    TextSpan(
                      text: "NiceToDo",
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ])),
              const SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                validator: (value) => Validate.email(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (val) {
                  email = val;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.maxFinite, 40),
                ),
                child: const Text("Submit"),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or"),
                  ),
                  SizedBox(
                      width: 80,
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: IconButton(
                        onPressed: googleLogin,
                        icon: Image.asset("assets/images/google_logo.png")),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.blue[600],
                        size: 36,
                      )),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
