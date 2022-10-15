import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MIU CSC422'),
          ),
          body: const Center(
              child: Text(
            'My First Flutter App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ))),
    );
  }
}
