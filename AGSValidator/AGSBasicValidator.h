//
//  AGSBasicValidator.h
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AGSUsernameTypeUsername = 0,
    AGSUsernameTypeEmail = 1,
    AGSUsernameTypePhoneNumber = 2
} AGSUsernameType;

@interface AGSBasicValidator : NSObject

@property (readonly, nonatomic) AGSUsernameType usernameType;

- (instancetype)initWithUsernameType:(AGSUsernameType)usernameType;

- (BOOL)validateUsername:(NSString *)username;
- (BOOL)validatePassword:(NSString *)password;

@end
