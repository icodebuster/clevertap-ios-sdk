//
//  NotificationService.m
//  testNotifServiceExt
//
//  Created by Peter Wilkniss on 6/26/18.
//  Copyright © 2018 Peter Wilkniss. All rights reserved.
//

#import "NotificationService.h"
//@import CleverTapSDK;

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    NSDictionary *userInfo = request.content.userInfo;
//    [CleverTap setCredentialsWithAccountID:@"TEST-Z9R-486-4W5Z" andToken:@"TEST-6b4-2c1"];
//
//    [CleverTap setDebugLevel:CleverTapLogDebug+22];
//    [[CleverTap sharedInstance] recordNotificationViewedEventWithData:userInfo];
//    [[CleverTap sharedInstance] recordEvent:@"testEventFromAppex"];
    [super didReceiveNotificationRequest:request withContentHandler:contentHandler];
    
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end
