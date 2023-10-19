import 'package:flutter/material.dart';
import 'package:isolates_demo/providers/data_providers.dart';
import 'package:isolates_demo/screens/first_screen.dart';
import 'package:isolates_demo/services/service_locatror.dart';
import 'package:provider/provider.dart';

void main() {
  setupServiceLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => DataProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Isolates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}
