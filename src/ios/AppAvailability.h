#import <Cordova/CDV.h>

@interface AppAvailability : CDVPlugin

- (void)checkAvailability:(CDVInvokedUrlCommand*)command;

- (void)openUrl:(CDVInvokedUrlCommand*)command;

@end