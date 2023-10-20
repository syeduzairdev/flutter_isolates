import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolates_demo/models/person_model.dart';
import 'package:isolates_demo/services/api_services.dart';
import 'package:isolates_demo/services/service_locatror.dart';

class DataProvider extends ChangeNotifier {
  final ApiServices _apiService = serviceLocator<ApiServices>();

  //user data  getter and setter
  List<PersonModel> _userDataList = [];
  List<PersonModel> get userDataList => _userDataList;
  set userDataList(List<PersonModel> value) {
    _userDataList = value;
    notifyListeners();
  }

  //employee data  getter and setter
  List<PersonModel> _employeeDataList = [];
  List<PersonModel> get employeeDataList => _employeeDataList;
  set employeeDataList(List<PersonModel> value) {
    _employeeDataList = value;
    notifyListeners();
  }

  //family data  getter and setter
  List<PersonModel> _familyDataList = [];
  List<PersonModel> get familyDataList => _familyDataList;
  set familyDataList(List<PersonModel> value) {
    _familyDataList = value;
    notifyListeners();
  }

  //relative data  getter and setter
  List<PersonModel> _relativeDataList = [];
  List<PersonModel> get relativeDataList => _relativeDataList;
  set relativeDataList(List<PersonModel> value) {
    _relativeDataList = value;
    notifyListeners();
  }

  //student data loading getter and setter
  List<PersonModel> _studentDataList = [];
  List<PersonModel> get studentDataList => _studentDataList;
  set studentDataList(List<PersonModel> value) {
    _studentDataList = value;
    notifyListeners();
  }

  bool _isAllDataLoaded = false;
  bool get isAllDataLoaded => _isAllDataLoaded;
  set isAllDataLoaded(bool value) {
    _isAllDataLoaded = value;
    notifyListeners();
  }

  //fetch all data
  fetchAllData() async {
    isAllDataLoaded = true;
    await _fetchAllData();
    isAllDataLoaded = false;
    notifyListeners();
  }

  Future<void> _fetchAllData() async {
    List messageData;
    messageData = await _apiService.getAllIsolatesData();
    userDataList = messageData[0];
    employeeDataList = messageData[1];
    familyDataList = messageData[2];
    relativeDataList = messageData[3];
    studentDataList = messageData[4];
  }
}
