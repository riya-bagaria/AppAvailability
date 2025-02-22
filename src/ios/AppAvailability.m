#import "AppAvailability.h"
#import <Cordova/CDV.h>

@implementation AppAvailability

- (void)checkAvailability:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;
    
    NSString* scheme = [command.arguments objectAtIndex:0];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)openUrl:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;
    
    NSString* url = [command.arguments objectAtIndex:0];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
    }
    else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

@end