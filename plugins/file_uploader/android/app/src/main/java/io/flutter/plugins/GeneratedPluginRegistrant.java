package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.bluechilli.flutteruploader.FlutterUploaderPlugin;
import com.tencent.file_uploader.FileUploaderPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterUploaderPlugin.registerWith(registry.registrarFor("com.bluechilli.flutteruploader.FlutterUploaderPlugin"));
    FileUploaderPlugin.registerWith(registry.registrarFor("com.tencent.file_uploader.FileUploaderPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
