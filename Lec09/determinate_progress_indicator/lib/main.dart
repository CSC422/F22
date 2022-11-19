import 'dart:async';
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
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
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
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinearProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.indigo),
                      value: _progressValue,
                    ),
                    Text('${(_progressValue * 100).round()}%'),
                  ],
                )
              : const Text(
                  "Data Downloaded",
                  style: TextStyle(fontSize: 25),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        tooltip: 'Download',
        child: const Icon(Icons.cloud_download),
      ),
    );
  }

  // this function updates the progress value
  void _updateProgress() {
    const delay = Duration(milliseconds: 250);
    Timer.periodic(delay, (Timer t) {
      setState(() {
        _progressValue += 0.05;
        // we "finish" downloading here
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          _progressValue = 0.0;
          t.cancel();
          return;
        }
      });
    });
  }
}
