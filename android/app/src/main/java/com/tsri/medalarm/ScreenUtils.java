package com.tsri.medalarm;

import android.app.Activity;
import android.view.Window;
import android.view.WindowManager;

public class ScreenUtils {
    public static void addFlags(final Activity activity) {
        addFlags(activity.getWindow());
    }
    private static void addFlags(final Window window) {
        window.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN |
                        WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED |
                        WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON,
                WindowManager.LayoutParams.FLAG_FULLSCREEN |
                        WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED |
                        WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
    }

    public static void clearFlags(final Activity activity) {
        clearFlags(activity.getWindow());
    }

    private static void clearFlags(final Window window) {
        window.clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN |
                        WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED |
                        WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON);
    }
}
