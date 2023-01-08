import 'package:flutter_test/flutter_test.dart';
import 'package:ss_pretty_log/ss_pretty_log.dart';
import 'package:ss_pretty_log/ss_pretty_log_platform_interface.dart';
import 'package:ss_pretty_log/ss_pretty_log_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSsPrettyLogPlatform
    with MockPlatformInterfaceMixin
    implements SsPrettyLogPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SsPrettyLogPlatform initialPlatform = SsPrettyLogPlatform.instance;

  test('$MethodChannelSsPrettyLog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSsPrettyLog>());
  });

  test('getPlatformVersion', () async {
    SsPrettyLog ssPrettyLogPlugin = SsPrettyLog();
    MockSsPrettyLogPlatform fakePlatform = MockSsPrettyLogPlatform();
    SsPrettyLogPlatform.instance = fakePlatform;

    expect(await ssPrettyLogPlugin.getPlatformVersion(), '42');
  });
}
