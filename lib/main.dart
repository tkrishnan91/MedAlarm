import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:medalarm/screens/AlarmConfigurationScreen.dart';
import 'package:medalarm/screens/AlarmScreen.dart';
import 'package:medalarm/screens/CameraScreen.dart';
import 'package:medalarm/screens/HomeScreen.dart';
import 'package:medalarm/screens/MedHistoryScreen.dart';
import 'package:medalarm/screens/TakeMedScreen.dart';

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
  Map<String, WidgetBuilder> routes;

  MyApp(activityName, cameras) {
    this.activityName = activityName;
    this.cameras = cameras;
    this.routes = <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => TakeMedScreen(),
      CAMERA_SCREEN: (BuildContext context) => CameraScreen(cameras),
      MEDHISTORY_SCREEN: (BuildContext context) => MedHistoryScreen(),
      ALARMCONFIGURATION_SCREEN: (BuildContext context) => AlarmConfigurationScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    //Depending on the calling activity, call the appropriate Widget.
    if (activityName == "CameraAlarmActivity") {
      return HomeScreen("Alarm", TakeMedScreen(), this.routes).build(context);
    } else {
      return HomeScreen("MedAlarm", AlarmScreen(title: 'Med Alarm'), this.routes).build(context);
    }
  }
}
