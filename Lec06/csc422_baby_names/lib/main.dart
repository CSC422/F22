import 'package:flutter/material.dart';

import 'data/db.dart';
import 'widgets/vote_items.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Baby Names Vote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = MyData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.reset_tv),
            onPressed: () {
              setState(() {
                data.reset();
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: VoteItems(
                data: data,
              ),
            ),
            Text('Length = ${data.db.length.toString()}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            addRandomName();
          });
        },
        tooltip: 'Add Name',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addRandomName() {
    if (!data.addName()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No more names to add')),
      );
    }
  }
}
