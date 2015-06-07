//
//  Error.m
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSError.h"

@implementation AGSError

+ (NSError *)noConnectionNameFound
{
    return [self errorWithCode:AGSErrorCodeNoConnectionNameFound
                   description:AGSValidatorLocalized(@"Authentication failed")
                 failureReason:AGSValidatorLocalized(@"Can't find connection name to use for authentication")];
}

+ (NSError *)notConnectedToInternetError
{
    return [self errorWithCode:AGSErrorCodeNotConnectedToInternet
                   description:AGSValidatorLocalized(@"The server could not be contacted")
                 failureReason:AGSValidatorLocalized(@"Make sure your network settings are correct and your network connection is active, or try again later.")];
}

#pragma mark - Login errors

+ (NSError *)defaultLoginErrorFor:(NSError *)error
{
    return [self errorWithCode:AGSAuthenticationFailed
                   description:AGSValidatorLocalized(@"There was an error logging in")
                 failureReason:nil];
}

+ (NSError *)invalidLoginCredentials:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email and password you entered are invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username and password you entered are invalid. Please try again.");
    }
    else {
       failureReason = AGSValidatorLocalized(@"The phone number and password you entered are invalid. Please try again.");
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidCredentials
                   description:AGSValidatorLocalized(@"Invalid login credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidLoginUsername:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email you entered is invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username you entered is invalid. Please try again.");
    }
    else {
        failureReason = AGSValidatorLocalized(@"The phone number you entered is invalid. Please try again.");
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidUsername
                   description:AGSValidatorLocalized(@"Invalid login credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidLoginPassword
{
    return [self errorWithCode:AGSErrorCodeInvalidPassword
                   description:AGSValidatorLocalized(@"Invalid login credentials")
                 failureReason:AGSValidatorLocalized(@"The password you entered is invalid. Please try again.")];
}

#pragma mark - SignUp errors

+ (NSError *)invalidSignUpCredentials:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email and password you entered are invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username and password you entered are invalid. Please try again.");
    }
    else {
       failureReason = AGSValidatorLocalized(@"The phone number and password you entered are invalid. Please try again.");
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidCredentials
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidSignUpUsername:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email you entered is invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username you entered is invalid. Please try again.");
    }
    else {
       failureReason = AGSValidatorLocalized(@"The phone number you entered is invalid. Please try again.");
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidUsername
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidSignUpPassword
{
    return [self errorWithCode:AGSErrorCodeInvalidPassword
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:AGSValidatorLocalized(@"The password you entered is invalid. Please try again.")];
}

#pragma mark - Change password errors

+ (NSError *)invalidChangePasswordCredentials:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email and password you entered are invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username and password you entered are invalid. Please try again.");
    }
    else {
       failureReason = AGSValidatorLocalized(@"The phone number and password you entered are invalid. Please try again.");
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidCredentials
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidChangePasswordUsername:(AGSUsernameType)usernameType
{
    NSString *failureReason;
    if (usernameType == AGSUsernameTypeEmail) {
        failureReason = AGSValidatorLocalized(@"The email you entered is invalid. Please try again.");
    }
    else if (usernameType == AGSUsernameTypeUsername) {
        failureReason = AGSValidatorLocalized(@"The username you entered is invalid. Please try again.");
    }
    else {
        failureReason = AGSValidatorLocalized(@"The phone number you entered is invalid. Please try again."); 
    }
    
    return [self errorWithCode:AGSErrorCodeInvalidUsername
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:failureReason];
}

+ (NSError *)invalidChangePasswordPassword
{
    return [self errorWithCode:AGSErrorCodeInvalidPassword
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:AGSValidatorLocalized(@"The password you entered is invalid. Please try again.")];
}

+ (NSError *)invalidChangePasswordRepeatPassword
{
    return [self errorWithCode:AGSErrorCodeInvalidRepeatPassword
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:AGSValidatorLocalized(@"The passwords you entered must match. Please try again.")];
}

+ (NSError *)invalidChangePasswordRepeatPasswordAndPassword
{
    return [self errorWithCode:AGSErrorCodeInvalidPasswordAndRepeatPassword
                   description:AGSValidatorLocalized(@"Invalid credentials")
                 failureReason:AGSValidatorLocalized(@"The passwords you entered must match. Please try again.")];
}

#pragma mark - Social Errors

+ (NSError *)unkownProviderForStrategy:(NSString *)strategyName
{
    return [self errorWithCode:AGSErrorCodeUknownProviderForStrategy
                   description:AGSValidatorLocalized(@"Couldn't found authentication method for unknown strategy")
                 failureReason:[NSString stringWithFormat:AGSValidatorLocalized(@"The strategy %@ has no registered authentication provider"), strategyName]];
}

+ (NSError *)facebookCancelled
{
    return [self errorWithCode:AGSErrorCodeFacebookCancelled
                   description:AGSValidatorLocalized(@"There was an error contacting Facebook")
                 failureReason:AGSValidatorLocalized(@"You need to authorize the application")];
}

+ (NSError *)twitterAppNotAuthorized
{
    return [self errorWithCode:AGSErrorCodeTwitterAppNotAuthorized
                   description:AGSValidatorLocalized(@"There was an error contacting Twitter")
                 failureReason:AGSValidatorLocalized(@"Permissions were not granted. Please authorize the app in Settings > Twitter")];
}

+ (NSError *)twitterAppOauthNotAuthorized
{
    return [self errorWithCode:AGSErrorCodeTwitterAppNotAuthorized
                   description:AGSValidatorLocalized(@"There was an error contacting Twitter")
                 failureReason:AGSValidatorLocalized(@"Permissions were not granted. Try again")];
}

+ (NSError *)twitterCancelled
{
    return [self errorWithCode:AGSErrorCodeTwitterCancelled
                   description:AGSValidatorLocalized(@"There was an error contacting Twitter")
                 failureReason:AGSValidatorLocalized(@"User cancelled the login operation. Try again")];
}

+ (NSError *)twitterNotConfigured
{
    return [self errorWithCode:AGSErrorCodeTwitterNotConfigured
                   description:AGSValidatorLocalized(@"There was an error contacting Twitter")
                 failureReason:AGSValidatorLocalized(@"The domain has not been setup for Twitter.")];
}

+ (NSError *)twitterInvalidAccount
{
    return [self errorWithCode:AGSErrorCodeTwitterInvalidAccount
                   description:AGSValidatorLocalized(@"There was an error contacting Twitter")
                 failureReason:AGSValidatorLocalized(@"The twitter account seems to be invalid. Please check it in Settings > Twitter and re-enter them.")];
}

+ (NSError *)googleplusFailed
{
    return [self errorWithCode:AGSErrorCodeGooglePlusFailed
                   description:AGSValidatorLocalized(@"There was an error contacting Google+")
                 failureReason:AGSValidatorLocalized(@"Permissions were not granted. Try again")];
}

#pragma mark - Utility methods

+ (NSError *)errorWithCode:(NSInteger)code description:(NSString *)description failureReason:(NSString *)failureReason
{
    NSError *error = [NSError errorWithDomain:ERROR_DOMAIN
                                         code:code
                                     userInfo:@{
                                                NSLocalizedDescriptionKey: description,
                                                NSLocalizedFailureReasonErrorKey: failureReason,
                                                }];
    return error;
}

@end
