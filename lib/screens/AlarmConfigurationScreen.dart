import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medalarm/model/AlarmModel.dart';

class AlarmConfigurationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlarmConfigurationScreenState();
  }
}

class _AlarmConfigurationScreenState extends State<AlarmConfigurationScreen> {
  static const platform = const MethodChannel('com.tsri.medalarm/alarm');
  String timeSet = "";
  String medName = "";
  int medDosage;

  final medNameController = TextEditingController();
  final medDosageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Add medication"),
          ),
          body: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: this.medNameController,
                      decoration: const InputDecoration(
                        hintText: 'Name of your medicine',
                        labelText: 'Drug name',

                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter a value";
                        }

                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: this.medDosageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter the drug dosage',
                        labelText: 'Dosage in mg',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter a value";
                        }
                        return null;
                      }),

                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child:
                          IconButton(
                            icon: Icon(
                              Icons.alarm_add,
                              size: 50,
                            ),
                            tooltip: "Set when you take this medication",
                            onPressed: () async {
                              this.timeSet = await _registerAlarm();
                              Navigator.pop(context, new AlarmModel(medNameController.text, int.tryParse(medDosageController.text), timeSet));
                            },)
                      )
                    ]),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ));
  }

  Future<String> _registerAlarm() async {
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

      return (selectedTime.hour.toString() + ":" + selectedTime.minute.toString());


      if(alarmSet)
      {
        setState(() {
          // This call to setState tells the Flutter framework that something has
          // changed in this State, which causes it to rerun the build method below
          // so that the display can reflect the updated values. If we changed
          // _counter without calling setState(), then the build method would not be
          // called again, and so nothing would appear to happen.
//          _listOfAlarms.add(selectedTime);
        timeSet = (selectedTime.hour.toString() + ": " + selectedTime.minute.toString());
        });}
    }
  }
}
