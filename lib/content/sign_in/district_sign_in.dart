import 'package:covid_app/content/screens/home.dart';
import 'package:covid_app/content/sign_in/result.dart';
import 'package:covid_app/content/utils/cowin.dart';
import 'package:flutter/material.dart';

class DistrictSearch extends StatefulWidget {
  DistrictSearch({Key? key}) : super(key: key);

  @override
  State<DistrictSearch> createState() => _DistrictSearchState();
}

class _DistrictSearchState extends State<DistrictSearch> {
  Result result = Result();

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
            SizedBox(height: 40),
            TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  label: Text(
                    "Enter State Name",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                onSubmitted: (text) {
                  result.getDistrict(text.toLowerCase());
                }),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                label: Text(
                  "Enter District Name",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              onSubmitted: (text) {
                result.getState(text.toLowerCase());
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
