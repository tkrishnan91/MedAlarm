import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlarmScreen extends StatefulWidget {
  AlarmScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<TimeOfDay> _listOfAlarms = [];
  static const platform = const MethodChannel('com.tsri.medalarm/alarm');


  void _registerAlarm() async {
    bool alarmSet = false;
    TimeOfDay selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (selectedTime != null) {
      try {
        alarmSet = await platform.invokeMethod("setAlarm", <String, dynamic>{
          'hour': selectedTime.hour,
          'minute': selectedTime.minute
        });
      } on PlatformException catch (e) {
        print("Was not able to setAlarm" + e.toString());
      }

      if(alarmSet)
      {
        setState(() {
          // This call to setState tells the Flutter framework that something has
          // changed in this State, which causes it to rerun the build method below
          // so that the display can reflect the updated values. If we changed
          // _counter without calling setState(), then the build method would not be
          // called again, and so nothing would appear to happen.
          _listOfAlarms.add(selectedTime);
        });}
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
