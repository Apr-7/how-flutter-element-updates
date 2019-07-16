import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PositionedTiles(title: 'how element and widget updates'),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  PositionedTiles({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PositionedTilesState createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles;

  @override
  void initState() {
    tiles = [
      StatefulColorfulTile(0),
      StatefulColorfulTile(1),
    ];
    super.initState();
  }

  void swapTiles(){
    this.setState((){
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        tooltip: 'Increment',
        child: Icon(Icons.face),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  final int index;
  final UniqueKey key;
  StatefulColorfulTile(this.index, {this.key});

  @override
  State<StatefulWidget> createState() {
    return _StatefulColorfulTileState();
  }
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {

  // color information is being stored in the state, not in the widgets themselves
  // when you swap the order of the two widgets, flutter walks element tree
  // checks type of the row widget and updates the reference

  // flutter uses the element tree and its corresponding state to determine what to actually display on the device
  // tile element checks the corresponding widget and gets the same type -- a tile widget

  // add key properties to the widget, now if we swap the widgets, the row widgets match like before, but the key of tile element doesn't
  // match the key of the correponding tile widget, so flutter deactive those elements, moving the references
  // then flutter looks through the non-match children for an element with the corresponding key, finds the match, updates its reference
  Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        width: 100,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
      Text('${widget.index}'),
    ],);
  }
}
