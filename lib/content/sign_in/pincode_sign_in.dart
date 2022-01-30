import 'package:covid_app/content/screens/home.dart';
import 'package:covid_app/content/utils/cowin.dart';
import 'package:flutter/material.dart';

class PinSearch extends StatelessWidget {
  PinSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text("Search With District"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                label: Text(
                  "Enter PinCode",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onSubmitted: (text) {},
            ),
            SizedBox(height: 10),
            //List
          ],
        ),
      ),
    );
  }
}
