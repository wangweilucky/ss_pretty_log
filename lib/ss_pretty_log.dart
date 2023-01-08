
import 'ss_pretty_log_platform_interface.dart';

class SsPrettyLog {
  Future<String?> getPlatformVersion() {
    return SsPrettyLogPlatform.instance.getPlatformVersion();
  }
}
