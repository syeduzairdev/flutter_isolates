import 'package:flutter/material.dart';
import 'package:isolates_demo/isolates/dummy_isolates.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolates')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Run Heavy Task'),
              onPressed: () => useIsolate(),
            ),
          ],
        ),
      ),
    );
  }
}
