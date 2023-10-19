import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isolates_demo/models/person_model.dart';
import 'package:isolates_demo/screens/second_screen.dart';
import 'package:isolates_demo/services/api_services.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Call All APIs in Isolate'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
