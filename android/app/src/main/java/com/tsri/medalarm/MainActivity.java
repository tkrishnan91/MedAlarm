package com.tsri.medalarm;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.provider.MediaStore;

import java.util.Calendar;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  static final int REQUEST_IMAGE_CAPTURE = 1;
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
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        PendingIntent pendingCameraIntent = PendingIntent.getActivity(this, 1, takePictureIntent, 0);
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minute);
        alarmManager.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingCameraIntent);
        result.success(true);

//        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
//          startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
//         result.success(true);
//        }
      }});
  }
}
