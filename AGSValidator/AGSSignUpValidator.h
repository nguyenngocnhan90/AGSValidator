//
//  AGSSignUpValidator.h
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/18/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSBasicValidator.h"
#import "AGSCredentialValidator.h"

@interface AGSSignUpValidator : AGSBasicValidator <AGSCredentialValidator>

- (void)initWithUsername:(NSString *)username password:(NSString *)password;

@end
