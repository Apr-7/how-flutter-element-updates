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
    // flutter's element-to-widget matching algorithm looks at one level of tree at a time, at first level of children (padding widget), everyting matchs up correctly
    // at the second level Flutter notices that the key of the tile element doesn't match the key of the widget, SO it deactivates that tile element, droppting those connections.
    // it creates a new one and initializes a new state
    // when matching up widgets to elements, Flutter only looks for a key that matches within a particular level in the tree.

    tiles = [
      Padding(
        padding: EdgeInsets.all(10.0),
        child: StatefulColorfulTile(0, key: UniqueKey()),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: StatefulColorfulTile(1, key: UniqueKey()),
      )
    ];
    super.initState();
  }

  void swapTiles() {
    this.setState(() {
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
  Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
      ],
    );
  }
}
