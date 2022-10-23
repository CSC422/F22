import 'dart:math';
import 'package:flutter/material.dart';

class ColoredTileModel {
  final String title;
  late final Color color;

  ColoredTileModel.random(this.title) {
    Random random = Random();
    color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  ColoredTileModel(this.title, this.color);
}
