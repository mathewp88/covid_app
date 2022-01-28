import 'package:covid_app/content/screens/authenticate.dart';
import 'package:covid_app/content/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid_app/google_sign.dart';
import 'package:covid_app/content/utils/auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Return Home() or Authenticate()
    return FutureBuilder(
      future: AuthService.signInWithGoogle(context),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (AuthService.signInWithGoogle(context) == null) {
          return Authenticate();
        } else {
          return Home();
        }
      },
    );
  }
}
