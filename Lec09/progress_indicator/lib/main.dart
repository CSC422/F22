import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LinearProgressIndicatorApp(),
    );
  }
}

class LinearProgressIndicatorApp extends StatefulWidget {
  const LinearProgressIndicatorApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return LinearProgressIndicatorAppState();
  }
}

class LinearProgressIndicatorAppState
    extends State<LinearProgressIndicatorApp> {
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Linear Progress Bar"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: _loading
              ? const CircularProgressIndicator()
              //const LinearProgressIndicator()
              : const Text("Press button for downloading",
                  style: TextStyle(fontSize: 25)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _loadData();
          });
        },
        tooltip: 'Download',
        child: const Icon(Icons.cloud_download),
      ),
    );
  }

  Future _loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loading = false;
    });
  }
}
