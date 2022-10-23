import 'package:flutter/material.dart';
import 'package:swap_tiles/util/util.dart';

class PositenedTiles extends StatefulWidget {
  PositenedTiles({Key? key}) : super(key: key) {
    info('PositenedTiles StatefulWidget Costructor Called, Key is $key');
  }

  @override
  State<PositenedTiles> createState() {
    return _PositenedTilesState();
  }
}

class _PositenedTilesState extends State<PositenedTiles> {
  late List<Widget> tiles;
  int counter = 0;

  @override
  void initState() {
    info('_PositenedTilesState initState Called');
    info('-------------------------------------');

    tiles = [
      //StatefulColorTile('Tile 1', key: UniqueKey()),
      //StatefulColorTile('Tile 2', key: UniqueKey()),
      //StatefulColorTile('A'),
      //StatefulColorTile('B'),
      //StateLessColorTile(title: 'A', clr: Colors.blue),
      //StateLessColorTile(title: 'B', clr: Colors.deepPurpleAccent),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    info('_PositenedTilesState build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Keys Swap Tiles'),
      ),
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: tiles,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_calls_rounded),
      ),
    );
  }

  void swapTiles() {
    info('-------------------------');
    info('swapTiles Called $counter times');
    counter++;
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
