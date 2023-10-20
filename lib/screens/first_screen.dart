import 'package:flutter/material.dart';
import 'package:isolates_demo/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "ISOLATES DEMO",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            //what is isolates
            const Text(
              "Isolates are Dart model for multithreading, though an isolate differs from a conventional thread in that it doesn’t share memory with the main program. This makes communication between isolates a little more complicated than between threads, but Dart provides a number of ways to pass messages between isolates. Isolates communicate by sending and receiving messages over ports. Each isolate has its own main loop, and when you send a message to an isolate, the message is put in a queue and processed when the isolate gets to it.",
              style: TextStyle(fontSize: 20),
            ),
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
