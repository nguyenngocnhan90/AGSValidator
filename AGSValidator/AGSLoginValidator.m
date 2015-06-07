//
//  AGSLoginValidator.m
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSLoginValidator.h"

@interface AGSLoginValidator ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;

@end

@implementation AGSLoginValidator

/**
 *  Init validator for login view: username, password
 *
 *  @param username
 *  @param password 
 */
- (void)setUsername:(NSString *)username password:(NSString *)password
{
    self.username = username;
    self.password = password;
}

- (BOOL)validateCredential:(NSError **)error
{
    BOOL validUsername = [self validateUsername:self.username];
    BOOL validPassword = [self validatePassword:self.password];
    
    if (!validUsername && !validPassword) {
        *error = [AGSError invalidLoginCredentials:self.usernameType];
    }
    
    if (validUsername && !validPassword) {
        *error = [AGSError invalidLoginPassword];
    }
    
    if (!validUsername && validPassword) {
        *error = [AGSError invalidLoginUsername:self.usernameType];
    }
    
    return validUsername && validPassword;
}

@end
