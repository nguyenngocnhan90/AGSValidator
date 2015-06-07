//
//  AGSSignUpValidator.m
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/18/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSSignUpValidator.h"

@interface AGSSignUpValidator ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;

@end

@implementation AGSSignUpValidator

/**
 *  Init with username and password for register param
 *
 *  @param username
 *  @param password
 */
- (void)initWithUsername:(NSString *)username password:(NSString *)password
{
    self.username = username;
    self.password = password;
}

- (BOOL)validateCredential:(NSError **)error
{
    BOOL validUsername = [self validateUsername:self.username];
    BOOL validPassword = [self validatePassword:self.password];
    
    if (!validUsername && !validPassword) {
        *error = [AGSError invalidSignUpCredentials:self.usernameType];
    }
    
    if (validUsername && !validPassword) {
        *error = [AGSError invalidSignUpPassword];
    }
    
    if (!validUsername && validPassword) {
        *error = [AGSError invalidSignUpUsername:self.usernameType];
    }
    
    return validUsername && validPassword;
}

@end
