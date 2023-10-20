import 'dart:isolate';

import 'package:isolates_demo/dummy_json/employee_data_json.dart';
import 'package:isolates_demo/dummy_json/family_data_json.dart';
import 'package:isolates_demo/dummy_json/relative_data_json.dart';
import 'package:isolates_demo/dummy_json/student_data_json.dart';
import 'package:isolates_demo/dummy_json/user_data_json.dart';
import 'package:isolates_demo/models/person_model.dart';

_getAllData(List<dynamic> _args) {
  // ignore: no_leading_underscores_for_local_identifiers
  SendPort _sendPort = _args[0];

  final userData = ApiServices.getUserData();
  final employeeData = ApiServices.getEmployeeData();
  final familyData = ApiServices.getFamilyData();
  final relativeData = ApiServices.getRelativeData();
  final studentData = ApiServices.getStudentData();
  _sendPort
      .send([userData, employeeData, familyData, relativeData, studentData]);
}

class ApiServices {
  // get user data from api
  static List<PersonModel> getUserData() {
    List jsonData = userData;
    List<PersonModel> personData =
        jsonData.map((e) => PersonModel.fromJson(e)).toList();
    return personData;
  }

  // get employee data from api
  static List<PersonModel> getEmployeeData() {
    List jsonData = employeeData;
    List<PersonModel> personData =
        jsonData.map((e) => PersonModel.fromJson(e)).toList();
    return personData;
  }

  // get family data from api
  static List<PersonModel> getFamilyData() {
    List jsonData = familyData;
    List<PersonModel> personData =
        jsonData.map((e) => PersonModel.fromJson(e)).toList();
    return personData;
  }

  // get relative data from api
  static List<PersonModel> getRelativeData() {
    List jsonData = relativesData;
    List<PersonModel> personData =
        jsonData.map((e) => PersonModel.fromJson(e)).toList();
    return personData;
  }

  // get student data from api
  static List<PersonModel> getStudentData() {
    List jsonData = studentData;
    List<PersonModel> personData =
        jsonData.map((e) => PersonModel.fromJson(e)).toList();
    return personData;
  }

  getAllIsolatesData() async {
    // ignore: no_leading_underscores_for_local_identifiers
    ReceivePort _receivePort = ReceivePort();
    await Isolate.spawn(_getAllData, [_receivePort.sendPort]);
    List<dynamic> messageData = await _receivePort.first;
    return messageData;
  }
}
