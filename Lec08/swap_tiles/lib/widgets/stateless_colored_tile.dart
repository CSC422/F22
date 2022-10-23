import 'package:flutter/material.dart';
import 'package:swap_tiles/util/util.dart';

class StateLessColorTile extends StatelessWidget {
  final Color clr;
  final String title;

  StateLessColorTile({required this.clr, required this.title, Key? key})
      : super(key: key) {
    info('StateLessColorTile constructor Called');
  }

  @override
  Widget build(BuildContext context) {
    info('StateLessColorTile build Called');
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        width: 150,
        height: 150,
        color: clr,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
