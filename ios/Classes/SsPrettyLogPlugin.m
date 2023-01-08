#import "SsPrettyLogPlugin.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <CocoaLumberjack/DDLogMacros.h>

static const DDLogLevel ddLogLevel = DDLogLevelDebug;

@implementation SsPrettyLogPlugin

+ (void)load {
    // [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode 控制台
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs 苹果系统日志

    // 创建本地日志文件
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 每24小时创建一个新文件
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // 最多允许创建7个文件
    [DDLog addLogger:fileLogger];
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"ss_pretty_log"
                                     binaryMessenger:[registrar messenger]];
    SsPrettyLogPlugin* instance = [[SsPrettyLogPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"logDebug" isEqualToString:call.method]) {
        NSDictionary *args = call.arguments;
        NSString *msg = args[@"msg"];
        DDLogDebug(@"%@", msg);
        result(@"");
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
