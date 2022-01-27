import 'package:covid_app/content/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Sign In"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: TextButton(
            child: Text("Sign In Anonymously"),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print("Error Signing In");
              } else {
                print("Signed In");
                print(result);
              }
            },
          )),
    );
  }
}
