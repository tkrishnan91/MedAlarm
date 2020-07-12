package com.tsri.medalarm;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;

import java.util.Calendar;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends BasicFlutterActivity {
  static MethodChannel alarmChannel;
  @Override
  protected void onCreate(Bundle savedInstanceState) {

    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    alarmChannel = new MethodChannel( getFlutterView(), "com.tsri.medalarm/alarm");
    alarmChannel.setMethodCallHandler((call, result) -> {
      if (call.method.equals("setAlarm")) {
        AlarmManager alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);
        int hour = call.argument("hour");
        int minute = call.argument("minute");
        System.out.println("Received time: " + hour + ":" + minute);
        Intent takePictureIntent = new Intent(getApplicationContext(), CameraAlarmActivity.class);
        takePictureIntent.putExtra("time", hour + ":" + minute);
        PendingIntent pendingCameraIntent = PendingIntent.getActivity(this, 1, takePictureIntent, PendingIntent.FLAG_UPDATE_CURRENT);
        Calendar calendar = Calendar.getInstance();
//        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minute);
        System.out.println("Time in millis: " + calendar.getTimeInMillis());
//        alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), AlarmManager.INTERVAL_DAY, pendingCameraIntent);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
          alarmManager.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingCameraIntent);
        }
//        alarmManager.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingCameraIntent);
        result.success(true);
      } else if (call.method.equals("getActivityInfo")) {
        result.success(handleActivityInfo());
      }});
  }

  @Override
  protected String handleActivityInfo() {
    return this.getClass().getSimpleName();
  }
}
