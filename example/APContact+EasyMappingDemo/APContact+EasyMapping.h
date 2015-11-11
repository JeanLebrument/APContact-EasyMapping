//
//  APContact+EasyMapping.h
//  APContact+EasyMappingDemo
//
//  Created by Jean Lebrument on 11/7/15.
//  Copyright © 2015 Jean Lebrument. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <APAddressBook/APAddressBook.h>
#import <APAddressBook/APContact.h>
#import <EasyMapping/EasyMapping.h>

@interface APContact (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APName (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APJob (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APPhone (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APEmail (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APAddress (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APSocialProfile (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APRelatedPerson (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APSource (APContact_EasyMapping) <EKMappingProtocol>

@end

@interface APRecordDate (APContact_EasyMapping) <EKMappingProtocol>

@end