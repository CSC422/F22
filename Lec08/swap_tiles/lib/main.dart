import 'package:flutter/material.dart';
import 'util/util.dart';
import 'package:swap_tiles/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    info('MyApp stateless Widget Costructor Called, Key is $key');
  }

  @override
  Widget build(BuildContext context) {
    info('MyApp stateless Widget build Called, Key is $key');
    return MaterialApp(
      home: PositenedTiles(),
    );
  }
}
