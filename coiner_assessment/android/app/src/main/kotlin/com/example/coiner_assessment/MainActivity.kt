package com.example.coiner_assessment

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("en_US") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("661612da-0054-4735-b2c5-c3b18ea68fca") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}