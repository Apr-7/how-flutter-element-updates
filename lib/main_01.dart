import 'package:flutter/material.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PositionedTilesState createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles;

  @override
  void initState() {
    tiles = [
      StatelessColorfulTile(Colors.red),
      StatelessColorfulTile(Colors.blue),
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

class StatelessColorfulTile extends StatelessWidget {
  final Color color;
  StatelessColorfulTile(this.color);
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
      ],
    );
  }
}
