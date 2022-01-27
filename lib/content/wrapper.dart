import 'package:covid_app/content/models/users.dart';
import 'package:covid_app/content/screens/authenticate.dart';
import 'package:covid_app/content/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    //Return Home() or Authenticate()
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
