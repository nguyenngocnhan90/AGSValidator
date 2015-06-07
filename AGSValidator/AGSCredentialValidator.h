//
//  AGSCredentialValidator.h
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGSError.h"

@protocol AGSCredentialValidator <NSObject>

@required

/**
 *  Check validation for cases: Login, register, sign up...
 *
 *  @param error
 *
 *  @return yes or no
 */
- (BOOL)validateCredential:(NSError **)error;

@end
