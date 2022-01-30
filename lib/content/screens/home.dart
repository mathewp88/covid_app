import 'package:covid_app/content/screens/favourites.dart';
import 'package:covid_app/content/sign_in/district_sign_in.dart';
import 'package:covid_app/content/screens/userinfoscreen.dart';
import 'package:covid_app/content/sign_in/pincode_sign_in.dart';
import 'package:covid_app/content/utils/auth.dart';
import 'package:covid_app/content/utils/cowin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  CowinData cowinData = new CowinData();

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
              MaterialPageRoute(
                  builder: (context) => UserInfoScreen(user: user!)),
            );
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DistrictSearch()),
                );
              },
              child: Text(
                "Search Using District",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PinSearch()),
                );
              },
              child: Text(
                "Search Using Pincode",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              },
              child: Text(
                "Favourites",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
