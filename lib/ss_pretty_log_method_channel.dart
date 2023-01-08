import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ss_pretty_log_platform_interface.dart';

/// An implementation of [SsPrettyLogPlatform] that uses method channels.
class MethodChannelSsPrettyLog extends SsPrettyLogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ss_pretty_log');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> logDebug(Map<String, String> args) async {
    final msg = await methodChannel.invokeMethod<String>('logDebug', args);
    return msg;
  }
}
