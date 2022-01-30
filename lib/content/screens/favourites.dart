import 'package:covid_app/content/screens/home.dart';
import 'package:covid_app/content/utils/cowin.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  int listSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text("Favourites"),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: listSize,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listSize > 1 ? "Got Data" : "No Results",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
