import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:isolates_demo/models/person_model.dart';
import 'package:isolates_demo/providers/data_providers.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final DataProvider dataProvider = DataProvider();
  @override
  void initState() {
    dataProvider.fetchAllData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DataProvider>(
              builder: (context, model, _) {
                if (model.isAllDataLoaded) {
                  // Show loading indicator if any of the data is still loading
                  return CircularProgressIndicator();
                } else {
                  // Show the loaded data
                  return Column(
                    children: [
                      Text(
                        'User Data: ${dataProvider..toString()}',
                      ),
                      Text(
                        'Employee Data: ${dataProvider.getEmployeeDataList.toString()}',
                      ),
                      Text(
                        'Family Data: ${dataProvider.getFamilyDataList.toString()}',
                      ),
                      Text(
                        'Relative Data: ${dataProvider.getRelativeDataList.toString()}',
                      ),
                      Text(
                        'Student Data: ${dataProvider.getStudentDataList.toString()}',
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
