//
//  APContact+EasyMapping.m
//  APContact+EasyMappingDemo
//
//  Created by Jean Lebrument on 11/7/15.
//  Copyright © 2015 Jean Lebrument. All rights reserved.
//

#import "APContact+EasyMapping.h"

@implementation APContact (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"recordID", @"note", @"websites", @"linkedRecordIDs"]];
    [mapping hasOne:[APName class] forKeyPath:@"name"];
    [mapping hasOne:[APJob class] forKeyPath:@"job"];
    [mapping mapKeyPath:@"thumbnail" toProperty:@"thumbnail" withValueBlock:^id(NSString *key, NSString *base64image) {
      return base64image ? [UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:base64image options:NSDataBase64DecodingIgnoreUnknownCharacters]] : NULL;
    } reverseBlock:^id(UIImage *image) {
      return image ? [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength] : NULL;
    }];
    [mapping hasMany:[APPhone class] forKeyPath:@"phones"];
    [mapping hasMany:[APEmail class] forKeyPath:@"emails"];
    [mapping hasMany:[APAddress class] forKeyPath:@"addresses"];
    [mapping hasMany:[APSocialProfile class] forKeyPath:@"socialProfiles"];
    [mapping mapKeyPath:@"birthday" toProperty:@"birthday" withDateFormatter:[NSDateFormatter ek_formatterForCurrentThread]];
    [mapping hasMany:[APRelatedPerson class] forKeyPath:@"relatedPersons"];
    [mapping hasOne:[APSource class] forKeyPath:@"source"];
    [mapping hasOne:[APRecordDate class] forKeyPath:@"recordDate"];
  }];
}

- (NSDictionary *)serializeToDictionary {
  return [EKSerializer serializeObject:self withMapping:[APContact objectMapping]];
}

@end

@implementation APName (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"firstName", @"lastName", @"middleName", @"compositeName"]];
  }];
}

@end

@implementation APJob (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"company", @"jobTitle"]];
  }];
}

@end

@implementation APPhone (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"number", @"originalLabel", @"localizedLabel"]];
  }];
}

@end

@implementation APEmail (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"address", @"originalLabel", @"localizedLabel"]];
  }];
}

@end

@implementation APAddress (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"street",
                                      @"city",
                                      @"state",
                                      @"zip",
                                      @"country",
                                      @"countryCode"]];
  }];
}

@end

@implementation APSocialProfile (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    NSDictionary *socialNetworkTypes = @{
                                         @"Unknown": @(APSocialNetworkUnknown),
                                         @"Facebook": @(APSocialNetworkFacebook),
                                         @"Twitter": @(APSocialNetworkTwitter),
                                         @"LinkedIn": @(APSocialNetworkLinkedIn),
                                         @"Flickr": @(APSocialNetworkFlickr),
                                         @"GameCenter": @(APSocialNetworkGameCenter)
                                         };
    
    [mapping mapKeyPath:@"socialNetwork" toProperty:@"socialNetwork" withValueBlock:^(NSString *key, id value) {
      return socialNetworkTypes[value];
    } reverseBlock:^id(id value) {
      return [socialNetworkTypes allKeysForObject:value].lastObject;
    }];
    [mapping mapPropertiesFromArray:@[@"username", @"userIdentifier"]];
    [mapping mapKeyPath:@"url" toProperty:@"url"
         withValueBlock:[EKMappingBlocks urlMappingBlock]
           reverseBlock:[EKMappingBlocks urlReverseMappingBlock]];
  }];
}


@end

@implementation APRelatedPerson (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"name", @"originalLabel", @"localizedLabel"]];
  }];
}

@end

@implementation APSource (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapPropertiesFromArray:@[@"sourceType", @"sourceID"]];
  }];
}

@end

@implementation APRecordDate (APContact_EasyMapping)

+ (EKObjectMapping *)objectMapping {
  return [EKObjectMapping mappingForClass:self withBlock:^(EKObjectMapping *mapping) {
    [mapping mapKeyPath:@"creationDate" toProperty:@"creationDate" withDateFormatter:[NSDateFormatter ek_formatterForCurrentThread]];
    [mapping mapKeyPath:@"modificationDate" toProperty:@"modificationDate" withDateFormatter:[NSDateFormatter ek_formatterForCurrentThread]];
  }];
}

@end