import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlarmConfigurationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AlarmConfigurationScreenState();
  }
}

class _AlarmConfigurationScreenState extends State<AlarmConfigurationScreen> {
  static const platform = const MethodChannel('com.tsri.medalarm/alarm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.local_hospital),
                              hintText: 'Name of your medicine',
                              labelText: 'Drug name*',
                            ) ,
                            validator: (value) {
                            if (value.isEmpty){
                              return "Please enter a value";
                            }
                            return null;
                            }
                          ),
                          TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.local_hospital),
                                hintText: 'Enter the drug dosage',
                                labelText: 'Dosage*',
                              ) ,
                              validator: (value) {
                                if (value.isEmpty){
                                  return "Please enter a value";
                                }
                                return null;
                              }
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    )
        );
  }
//  void _registerAlarm() async {
//    bool alarmSet = false;
//    TimeOfDay selectedTime = await showTimePicker(
//      initialTime: TimeOfDay.now(),
//      context: context,
//    );
//
//    if (selectedTime != null) {
//      try {
//        alarmSet = await platform.invokeMethod("setAlarm", <String, dynamic>{
//          'hour': selectedTime.hour,
//          'minute': selectedTime.minute
//        });
//      } on PlatformException catch (e) {
//        print("Was not able to setAlarm" + e.toString());
//      }
//
//      if(alarmSet)
//      {
//        setState(() {
//          // This call to setState tells the Flutter framework that something has
//          // changed in this State, which causes it to rerun the build method below
//          // so that the display can reflect the updated values. If we changed
//          // _counter without calling setState(), then the build method would not be
//          // called again, and so nothing would appear to happen.
//          _listOfAlarms.add(selectedTime);
//        });}
//    }
//  }
}
