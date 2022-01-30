import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CowinData {
  late int state_id = 0;
  late int district_id = 0;

  late final AppointmentList;

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
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=${district_id}&date=${dateParse.day}-${dateParse.month}-${dateParse.year}"));
    if (response.statusCode == 200) {
      String data = response.body;
      AppointmentList = jsonDecode(data);
      try {
        print("Appointment List Received");
        state_id = 0;
        district_id = 0;
      } catch (e) {
        print(e);
      }
    } else {
      print("Could Not Fetch State List!");
    }
  }

  //Get Appointment From Pincode
  Future<void> getAppointmentListPin(String pin) async {
    Response response = await get(Uri.parse(
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?pincode=${pin}&date=${dateParse.day}-${dateParse.month}-${dateParse.year}"));

    if (response.statusCode == 200) {
      String data = response.body;
      AppointmentList = (data);
      try {
        print("Appointment List Received");
        state_id = 0;
        district_id = 0;
      } catch (e) {
        print(e);
      }
    } else {
      print("Could Not Fetch State List!");
    }
  }
}
