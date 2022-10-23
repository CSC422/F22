import 'package:flutter/material.dart';
import 'package:form_nav/edit_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? editableText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widget Communication")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              editableText ?? "Want To Change Text?",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            ElevatedButton(
                child: const Text("Next Page"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPage((value) {
                                setState(() {
                                  editableText = value;
                                });
                              })));
                }),
          ],
        ),
      ),
    );
  }
}
