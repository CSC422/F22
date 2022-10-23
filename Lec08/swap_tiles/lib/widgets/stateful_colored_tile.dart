import 'package:flutter/material.dart';
import 'package:swap_tiles/models/random_tile.dart';
import '/util/util.dart';

class StatefulColorTile extends StatefulWidget {
  final String title;
  StatefulColorTile(this.title, {Key? key}) : super(key: key) {
    info('StatefulColorTile constructor Called');
  }

  @override
  State<StatefulWidget> createState() {
    return _StatefulColorTileState(title: title);
  }
}

class _StatefulColorTileState extends State<StatefulColorTile> {
  late final ColoredTileModel _tileData;

  _StatefulColorTileState({required String title}) {
    _tileData = ColoredTileModel.random(title);
    info('_StatefulColorTileState constructor Called ${_tileData.color}');
  }

  @override
  Widget build(BuildContext context) {
    info('_StatefulColorTileState build Called');
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        width: 150,
        height: 150,
        color: _tileData.color,
        child: Center(
            child: Text(
          _tileData.title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
