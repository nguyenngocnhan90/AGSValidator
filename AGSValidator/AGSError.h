//
//  Error.h
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGSBasicValidator.h"

#define AGSValidatorLocalized(key)      NSLocalizedStringFromTable(key, @"AGSValidator", nil)
#define ERROR_DOMAIN        @"com.agilsun"

typedef NS_ENUM(NSInteger, AGSErrorCode)
{
    AGSAuthenticationFailed = 0,
    /**
     *  Both password and email/username are invalid
     */
    AGSErrorCodeInvalidCredentials,
    /**
     *  Username/Email is invalid
     */
    AGSErrorCodeInvalidUsername,
    /**
     *  Password is invalid
     */
    AGSErrorCodeInvalidPassword,
    /**
     *  Repeat password is invalid (empty or doesnt match password)
     */
    AGSErrorCodeInvalidRepeatPassword,
    /**
     *  Both password and repeat password are invalid
     */
    AGSErrorCodeInvalidPasswordAndRepeatPassword,
    /**
     *  User cancelled facebook auth flow (Safari or Native)
     */
    AGSErrorCodeFacebookCancelled,
    /**
     *  User didn't authorize twitter app for authentication
     */
    AGSErrorCodeTwitterAppNotAuthorized,
    /**
     *  User cancelled twitter auth flow (Safari or Native)
     */
    AGSErrorCodeTwitterCancelled,
    /**
     *  Twitter is not configured in Auth0 Dashboard
     */
    AGSErrorCodeTwitterNotConfigured,
    /**
     *  Twitter account in iOS is invalid (e.g: password changed). It must be reentered in iOS Settings.
     */
    AGSErrorCodeTwitterInvalidAccount,
    /**
     *  Strategy is not found in A0Application. Please check if it's enabled in Auth0 Dashboard
     */
    AGSErrorCodeUknownProviderForStrategy,
    /**
     *  Safari/WebView auth flow was cancelled by the user
     */
    AGSErrorCodeNoConnectionNameFound,
    /**
     *  When device is not connected to internet.
     */
    AGSErrorCodeNotConnectedToInternet,
    /**
     *  When Google+ authentication fails
     */
    AGSErrorCodeGooglePlusFailed,
};

@interface AGSError : NSObject

+ (NSError *)noConnectionNameFound;

+ (NSError *)notConnectedToInternetError;

///----------------------------------------
/// @name Login Errors
///----------------------------------------

+ (NSError *)defaultLoginErrorFor:(NSError *)error;
+ (NSError *)invalidLoginCredentials:(AGSUsernameType)usernameType;
+ (NSError *)invalidLoginUsername:(AGSUsernameType)usernameType;
+ (NSError *)invalidLoginPassword;

///----------------------------------------
/// @name Sign Up Errors
///----------------------------------------

+ (NSError *)invalidSignUpCredentials:(AGSUsernameType)usernameType;
+ (NSError *)invalidSignUpUsername:(AGSUsernameType)usernameType;
+ (NSError *)invalidSignUpPassword;

///----------------------------------------
/// @name Change Password Errors
///----------------------------------------

+ (NSError *)invalidChangePasswordCredentials:(AGSUsernameType)usernameType;
+ (NSError *)invalidChangePasswordUsername:(AGSUsernameType)usernameType;
+ (NSError *)invalidChangePasswordPassword;
+ (NSError *)invalidChangePasswordRepeatPassword;
+ (NSError *)invalidChangePasswordRepeatPasswordAndPassword;

///----------------------------------------
/// @name Enterprise & Social Errors
///----------------------------------------

+ (NSError *)unkownProviderForStrategy:(NSString *)strategyName;
+ (NSError *)facebookCancelled;
+ (NSError *)twitterAppNotAuthorized;
+ (NSError *)twitterAppOauthNotAuthorized;
+ (NSError *)twitterCancelled;
+ (NSError *)twitterNotConfigured;
+ (NSError *)twitterInvalidAccount;
+ (NSError *)googleplusFailed;

@end
