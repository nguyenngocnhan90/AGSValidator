//
//  AGSChangePassword.m
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSChangePasswordValidator.h"

@interface AGSChangePasswordValidator ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *repeatPassword;

@end

@implementation AGSChangePasswordValidator

/**
 *  Init validator for change password form
 *
 *  @param username
 *  @param password
 *  @param repeatPassword
 */
- (void)initWithUsername:(NSString *)username password:(NSString *)password repeatPassword:(NSString *)repeatPassword
{
    self.username = username;
    self.password = password;
    self.repeatPassword = repeatPassword;
}

- (BOOL)validateCredential:(NSError **)error
{
    BOOL validUsername = [self validateUsername:self.username];
    BOOL validPassword = [self validatePassword:self.password];
    BOOL validRepeat = [self validatePassword:self.repeatPassword] && [self.password isEqualToString:self.repeatPassword];
    
    if (!validUsername && (!validPassword || !validRepeat)) {
        *error = [AGSError invalidChangePasswordCredentials:self.usernameType];
    }
    
    if (validUsername && !validPassword && !validRepeat) {
        *error = [AGSError invalidChangePasswordRepeatPasswordAndPassword];
    }
    
    if (validUsername && validPassword && !validRepeat) {
        *error = [AGSError invalidChangePasswordRepeatPassword];
    }
    
    if (validUsername && !validPassword && validRepeat) {
        *error = [AGSError invalidChangePasswordPassword];
    }
    
    if (!validUsername && validPassword && validRepeat) {
        *error = [AGSError invalidChangePasswordUsername:self.usernameType];
    }
    
    return validUsername && validPassword && validRepeat;
}

@end
