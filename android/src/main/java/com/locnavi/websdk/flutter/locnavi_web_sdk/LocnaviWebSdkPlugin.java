package com.locnavi.websdk.flutter.locnavi_web_sdk;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.locnavi.websdk.LocNaviWebSDK;

import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** LocnaviWebSdkPlugin */
public class LocnaviWebSdkPlugin implements FlutterPlugin, ActivityAware, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "locnavi_web_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("init")) {
      final String appKey = call.argument("appKey");
      final String serverUrl = call.argument("serverUrl");
      final String uploadApi = call.argument("uploadApi");
      final int uploadInterval = call.argument("uploadInterval");
      final String[] uuids = call.argument("uuids");
      final boolean debug = call.argument("debug");

      LocNaviWebSDK.Configuration config = new LocNaviWebSDK.Configuration
              .Builder(activity.getApplicationContext())
              .appKey(appKey).serverUrl(serverUrl)
              .uploadApi(uploadApi)
              .uploadInterval(uploadInterval)
              .uuids(uuids).debug(debug).build();
      LocNaviWebSDK.init(config);

    } else if (call.method.equals("openMap")) {
      final String mapId = call.argument("mapId");
      final String poi = call.argument("poi");
      LocNaviWebSDK.openMap(activity.getApplicationContext(), mapId, poi);
    }
    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activity = null;
  }

  @Override
  public void onDetachedFromActivity() {
    activity = null;
  }
}
