package com.tsri.medalarm;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class CameraAlarmActivity extends BasicFlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        Intent intent = getIntent();
        System.out.println("TIME CAMERA: " + intent.getStringExtra("time"));
        final MethodChannel platformChannel = new MethodChannel( getFlutterView(), "com.tsri.medalarm/alarm");
        platformChannel.setMethodCallHandler((call, result) -> {
            if (call.method.equals("getActivityInfo")) {
                result.success(handleActivityInfo());
            }
        });
    }

    @Override
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        ScreenUtils.addFlags(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        ScreenUtils.clearFlags(this);
    }

    @Override
    protected String handleActivityInfo() {
        return this.getClass().getSimpleName();
    }
}
