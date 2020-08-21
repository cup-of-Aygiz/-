import "package:flutter/material.dart";
import 'package:study1/pages/pers_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //stateful
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersListPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key); //

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter;
  int _ggh;

  _MyHomePageState() {
    _counter = 10;
    _ggh = 1;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _incrementGgh() {
    setState(() {
      _ggh++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //page A

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('${widget.title} ${_ggh + 1}'),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You lose in lol this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_ggh',
              style: TextStyle(
                color: Color(0xFF0000FF),
                fontSize: 200,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),

      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 100, left: 20),
        child: FloatingActionButton(
          onPressed: () {
            _incrementGgh();
            _incrementCounter();
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.adb,
            color: Color(0xFF4e76b4),
          ),
          backgroundColor: Colors.amber,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
