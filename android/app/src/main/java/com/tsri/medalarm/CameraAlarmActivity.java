package com.tsri.medalarm;

import android.os.Bundle;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class CameraAlarmActivity extends BasicFlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        final MethodChannel platformChannel = new MethodChannel( getFlutterView(), "com.tsri.medalarm/alarm");
        platformChannel.setMethodCallHandler((call, result) -> {
            if (call.method.equals("getActivityInfo")) {
                result.success(handleActivityInfo());
            }
        });
    }

    @Override
    protected String handleActivityInfo() {
        return this.getClass().getSimpleName();
    }
}
