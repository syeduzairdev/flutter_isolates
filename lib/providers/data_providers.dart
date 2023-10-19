import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolates_demo/models/person_model.dart';
import 'package:isolates_demo/services/api_services.dart';
import 'package:isolates_demo/services/service_locatror.dart';

class DataProvider extends ChangeNotifier {
  final ApiServices _apiService = serviceLocator<ApiServices>();

  //user data loading getter and setter
  List<PersonModel> userDataList = [];
  List<PersonModel> get getUserDataList => userDataList;
  set setUserDataList(List<PersonModel> userDataList) {
    this.userDataList = userDataList;
    notifyListeners();
  }

  bool isUserDataLoaded = false;
  bool get getIsUserDataLoaded => isUserDataLoaded;
  set setIsUserDataLoaded(bool isUserDataLoaded) {
    this.isUserDataLoaded = isUserDataLoaded;
    notifyListeners();
  }

  // void getUserData(List<dynamic> _) {
  //   isUserDataLoaded = true;
  //   compute<List<PersonModel>, List<dynamic>>(_apiService.getUserData, [])
  //       .then((data) {
  //     userDataList = data;
  //     isUserDataLoaded = false;
  //     notifyListeners();
  //   });
  // }

  //employee data loading getter and setter
  List<PersonModel> employeeDataList = [];
  List<PersonModel> get getEmployeeDataList => employeeDataList;
  set setEmployeeDataList(List<PersonModel> employeeDataList) {
    this.employeeDataList = employeeDataList;
    notifyListeners();
  }

  bool isEmployeeDataLoaded = false;
  bool get getIsEmployeeDataLoaded => isEmployeeDataLoaded;
  set setIsEmployeeDataLoaded(bool isEmployeeDataLoaded) {
    this.isEmployeeDataLoaded = isEmployeeDataLoaded;
    notifyListeners();
  }

  getEmployee() {
    isEmployeeDataLoaded = true;
    employeeDataList = ApiServices.getEmployeeData();
    isEmployeeDataLoaded = false;
    notifyListeners();
  }

  //family data loading getter and setter
  List<PersonModel> familyDataList = [];
  List<PersonModel> get getFamilyDataList => familyDataList;
  set setFamilyDataList(List<PersonModel> familyDataList) {
    this.familyDataList = familyDataList;
    notifyListeners();
  }

  bool isFamilyDataLoaded = false;
  bool get getIsFamilyDataLoaded => isFamilyDataLoaded;
  set setIsFamilyDataLoaded(bool isFamilyDataLoaded) {
    this.isFamilyDataLoaded = isFamilyDataLoaded;
    notifyListeners();
  }

  getFamily() {
    isFamilyDataLoaded = true;
    familyDataList = ApiServices.getFamilyData();
    isFamilyDataLoaded = false;
    notifyListeners();
  }

  //relative data loading getter and setter
  List<PersonModel> relativeDataList = [];
  List<PersonModel> get getRelativeDataList => relativeDataList;
  set setRelativeDataList(List<PersonModel> relativeDataList) {
    this.relativeDataList = relativeDataList;
    notifyListeners();
  }

  bool isRelativeDataLoaded = false;
  bool get getIsRelativeDataLoaded => isRelativeDataLoaded;
  set setIsRelativeDataLoaded(bool isRelativeDataLoaded) {
    this.isRelativeDataLoaded = isRelativeDataLoaded;
    notifyListeners();
  }

  getRelative() {
    isRelativeDataLoaded = true;
    relativeDataList = ApiServices.getRelativeData();
    isRelativeDataLoaded = false;
    notifyListeners();
  }

  //student data loading getter and setter
  List<PersonModel> studentDataList = [];
  List<PersonModel> get getStudentDataList => studentDataList;

  set setStudentDataList(List<PersonModel> studentDataList) {
    this.studentDataList = studentDataList;
    notifyListeners();
  }

  bool isStudentDataLoaded = false;
  bool get getIsStudentDataLoaded => isStudentDataLoaded;
  set setIsStudentDataLoaded(bool isStudentDataLoaded) {
    this.isStudentDataLoaded = isStudentDataLoaded;
    notifyListeners();
  }

  getStudent() {
    isStudentDataLoaded = true;
    studentDataList = ApiServices.getStudentData();
    isStudentDataLoaded = false;
    notifyListeners();
  }

  bool isAllDataLoaded = false;
  bool get getIsAllDataLoaded => isAllDataLoaded;
  set setIsAllDataLoaded(bool isAllDataLoaded) {
    this.isAllDataLoaded = isAllDataLoaded;
    notifyListeners();
  }

  Future<void> fetchAllData() async {
    isAllDataLoaded = true;
    ApiServices.getAllIsolatesData();

    isAllDataLoaded = false;
  }
}
