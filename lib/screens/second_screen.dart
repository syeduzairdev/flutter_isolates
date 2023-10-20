import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:isolates_demo/models/person_model.dart';
import 'package:isolates_demo/providers/data_providers.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  DataProvider? _dataProviderViewModel;

  @override
  void initState() {
    _dataProviderViewModel = Provider.of<DataProvider>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _dataProviderViewModel!.fetchAllData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<DataProvider>(
        builder: (context, model, _) {
          if (model.isAllDataLoaded) {
            // Show loading indicator if any of the data is still loading
            return const Center(child: CircularProgressIndicator());
          } else {
            // Show the loaded data
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildDataTable("User Data", model.userDataList),
                  _buildDataTable("Employee Data", model.employeeDataList),
                  _buildDataTable("Family Data", model.familyDataList),
                  _buildDataTable("Relative Data", model.relativeDataList),
                  _buildDataTable("Student Data", model.studentDataList),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDataTable(String title, List<PersonModel> dataList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold))),
        DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Age'),
            ),
            // Add additional DataColumn widgets for other fields as needed
          ],
          rows: List<DataRow>.generate(
            dataList.length,
            (index) => DataRow(
              cells: <DataCell>[
                DataCell(Text(dataList[index].name!)),
                DataCell(Text(dataList[index].age.toString())),
                // Add additional DataCell widgets for other fields as needed
              ],
            ),
          ),
        ),
      ],
    );
  }
}
