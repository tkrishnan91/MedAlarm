import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sri Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: AlarmPage(title: 'Med Alarm'),
    );
  }
}

class AlarmPage extends StatefulWidget {
  AlarmPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<TimeOfDay> _listOfAlarms = [];

  void _registerAlarm() async {
    TimeOfDay selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (selectedTime != null) {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _listOfAlarms.add(selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final Random rng = Random();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _listOfAlarms.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text(_listOfAlarms[index].format(ctxt)),
                    subtitle: Text('Advil Morning'),
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.delete_forever),
                          onPressed: () {
                            setState(() {
                              _listOfAlarms.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registerAlarm,
        tooltip: 'Add alarm',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> getListOfAlarms(List<TimeOfDay> listOfTimeOfDays) {
    return listOfTimeOfDays
        .map((dateTime) => Text(dateTime.format(context)))
        .toList();
  }
}
