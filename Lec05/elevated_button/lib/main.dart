import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: const Color.fromARGB(255, 0, 75, 0),
    );
    int count = 0;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              count--;
            },
            child: const Text('Decrement'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              print('Test Button count = $count');
              count++;
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
