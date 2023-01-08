import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ss_pretty_log_method_channel.dart';

abstract class SsPrettyLogPlatform extends PlatformInterface {
  /// Constructs a SsPrettyLogPlatform.
  SsPrettyLogPlatform() : super(token: _token);

  static final Object _token = Object();

  static SsPrettyLogPlatform _instance = MethodChannelSsPrettyLog();

  /// The default instance of [SsPrettyLogPlatform] to use.
  ///
  /// Defaults to [MethodChannelSsPrettyLog].
  static SsPrettyLogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SsPrettyLogPlatform] when
  /// they register themselves.
  static set instance(SsPrettyLogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
