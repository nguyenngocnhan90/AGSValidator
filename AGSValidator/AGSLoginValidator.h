//
//  AGSLoginValidator.h
//  OTTApp
//
//  Created by Ngoc Nhan Nguyen on 3/17/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "AGSBasicValidator.h"
#import "AGSCredentialValidator.h"

@interface AGSLoginValidator : AGSBasicValidator <AGSCredentialValidator>

- (void)setUsername:(NSString *)username password:(NSString *)password;

@end
