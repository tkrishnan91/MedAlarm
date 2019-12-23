
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:medalarm/screens/AlarmConfigurationScreen.dart';
import 'package:medalarm/screens/AlarmScreen.dart';
import 'package:medalarm/screens/CameraScreen.dart';
import 'package:medalarm/screens/MedHistoryScreen.dart';
import 'package:medalarm/screens/TakeMedScreen.dart';
import 'package:camera/camera.dart';

import 'constants/constants.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const platform = const MethodChannel('com.tsri.medalarm/alarm');
  List<CameraDescription> cameras = await availableCameras();
  String activityName = await platform.invokeMethod("getActivityInfo");
  runApp(MyApp(activityName, cameras));
}

class MyApp extends StatelessWidget {
  String activityName;
  List<CameraDescription> cameras;
  MyApp(this.activityName, this.cameras);
  @override
  Widget build(BuildContext context){
    if(activityName == "CameraAlarmActivity")
    {
      return MaterialApp(
        title: 'Sri Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: TakeMedScreen(),
        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => TakeMedScreen(),
          CAMERA_SCREEN: (BuildContext context) => CameraScreen(this.cameras),
          MEDHISTORY_SCREEN: (BuildContext context) => MedHistoryScreen(),
        }
      );
    }else {
      return MaterialApp(
          title: 'Sri Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: AlarmScreen(title: 'Med Alarm'),
          routes: <String, WidgetBuilder>{
            HOME_SCREEN: (BuildContext context) => TakeMedScreen(),
            CAMERA_SCREEN: (BuildContext context) => CameraScreen(this.cameras),
            MEDHISTORY_SCREEN: (BuildContext context) => MedHistoryScreen(),
            ALARMCONFIGURATION_SCREEN: (BuildContext context) => AlarmConfigurationScreen(),
          }
      );
    }
  }
}


