//
//  AGSBasicValidator.m
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSBasicValidator.h"

@interface AGSBasicValidator ()

@property (strong, nonatomic) NSPredicate *predicate;
@property (assign, nonatomic) AGSUsernameType usernameType;

@end

@implementation AGSBasicValidator

- (instancetype)initWithUsernameType:(AGSUsernameType)usernameType;
{
    self = [super init];
    if (self) {
        NSString *regex;
        
        self.usernameType = usernameType;
        
        if (usernameType != AGSUsernameTypeUsername) {
            if (self.usernameType == AGSUsernameTypeEmail) {
                regex = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
            }
            else {
                regex = @"^\\+(?:[0-9] ?){6,14}[0-9]$";
            }
            
            self.predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        }
    }
    return self;
}

/**
 *  Validate user name in case: username, email, phone
 *
 *  @param username
 *
 *  @return
 */
- (BOOL)validateUsername:(NSString *)username
{
    if (self.usernameType == AGSUsernameTypeUsername) {
        return username.length > 0;
    }
    
    return [self.predicate evaluateWithObject:username];
}

/**
 *  Validate password
 *
 *  @param password
 *
 *  @return 
 */
- (BOOL)validatePassword:(NSString *)password
{
    return password.length > 0;
}

@end
