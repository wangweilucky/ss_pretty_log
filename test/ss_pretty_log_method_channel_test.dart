import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ss_pretty_log/ss_pretty_log_method_channel.dart';

void main() {
  MethodChannelSsPrettyLog platform = MethodChannelSsPrettyLog();
  const MethodChannel channel = MethodChannel('ss_pretty_log');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
