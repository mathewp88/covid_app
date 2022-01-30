import 'dart:convert';
import 'package:covid_app/content/screens/home.dart';
import 'package:covid_app/content/sign_in/district_sign_in.dart';
import 'package:covid_app/content/utils/cowin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Result extends StatefulWidget {
  Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late int state_id;
  late int district_id;

  var AppointmentList;

  var dateParse = DateTime.parse(DateTime.now().toString());

  //Get List Of States
  Future<void> getStateList(String state_name) async {
    Response response = await get(
        Uri.parse("https://cdn-api.co-vin.in/api/v2/admin/location/states"));

    if (response.statusCode == 200) {
      String data = response.body;
      var stateList = jsonDecode(data);
      try {
        for (int i = 0; i < stateList['states'].length; i++) {
          if (state_name ==
              stateList['states'][i]['state_name'].toLowerCase()) {
            state_id = stateList['states'][i]['state_id'];
          }
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Could Not Fetch State List!");
    }
  }

  //Get List of Districts
  Future<void> getDistrictList(String district_name) async {
    Response response = await get(Uri.parse(
        "https://cdn-api.co-vin.in/api/v2/admin/location/districts/${state_id}"));

    if (response.statusCode == 200) {
      String data = response.body;
      var districtList = jsonDecode(data);
      try {
        for (int i = 0; i < districtList['districts'].length; i++) {
          if (district_name ==
              districtList['districts'][i]['district_name'].toLowerCase()) {
            district_id = districtList['districts'][i]['district_id'];
            getAppointmentList();
          }
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Could Not Fetch State List!");
    }
  }

  //Get Appointment From District
  Future<void> getAppointmentList() async {
    Response response = await get(Uri.parse(
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=300&date=${dateParse.day}-${dateParse.month}-${dateParse.year}"));
    if (response.statusCode == 200) {
      String data = response.body;
      AppointmentList = jsonDecode(data);
      try {
        print("Appointment List Received");
        print(AppointmentList);
        state_id = 0;
        district_id = 0;
      } catch (e) {
        print(e);
      }
    } else {
      print("Could Not Fetch State List!");
    }
  }

  @override
  void initState() {
    getStateList(DistrictSearch.dist);
    getDistrictList(DistrictSearch.stat);
    print(DistrictSearch.dist);
    getAppointmentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Results"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: AppointmentList['centers'].length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32.0, right: 16.0, left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppointmentList['centers'][index]['name'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Note Text",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
