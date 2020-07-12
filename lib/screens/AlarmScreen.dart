import 'package:flutter/material.dart';
import 'package:medalarm/constants/constants.dart';
import 'package:medalarm/model/AlarmModel.dart';

class AlarmScreen extends StatefulWidget {
  AlarmScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<AlarmModel> _listOfAlarms = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    title: Text(_listOfAlarms[index].time),
                    subtitle: Text(_listOfAlarms[index].medName + " " + _listOfAlarms[index].medDosage.toString() + " mg"),
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
        onPressed: () {
          _getAlarmInformation(context);
          },
        tooltip: 'Add alarm',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _getAlarmInformation(BuildContext context) async {
    final result = await Navigator.pushNamed(context, ALARMCONFIGURATION_SCREEN);
    setState(() {
      _listOfAlarms.add(result);
    });
  }
}
