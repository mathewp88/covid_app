import 'package:covid_app/content/screens/userinfoscreen.dart';
import 'package:covid_app/content/utils/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Covid Vaccine"),
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () async {
            User? user = await AuthService.signInWithGoogle(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => UserInfoScreen(user: user!)),
            );
          },
        ),
      ),
    );
  }
}
