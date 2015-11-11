//
//  AppDelegate.m
//  APContact+EasyMappingDemo
//
//  Created by Jean Lebrument on 11/8/15.
//  Copyright © 2015 Jean Lebrument. All rights reserved.
//

#import "AppDelegate.h"
#import <APAddressBook/APAddressBook.h>
#import <EasyMapping/EasyMapping.h>
#import "APContact+EasyMapping.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  APAddressBook *addressBook = [[APAddressBook alloc] init];
  
  addressBook.fieldsMask = APContactFieldAll;
  
  [addressBook loadContacts:^(NSArray<APContact *> * _Nullable contacts, NSError * _Nullable error) {
    NSArray *serializedContacts = [EKSerializer serializeCollection:contacts withMapping:[APContact objectMapping]];
    
    for (NSDictionary *serializedContact in serializedContacts) {
      NSLog(@"serializedContact: %@", serializedContact);
    }
    
    NSArray *contactsArray = [EKMapper arrayOfObjectsFromExternalRepresentation:serializedContacts
                                                                withMapping:[APContact objectMapping]];
    
    NSLog(@"contactsArray: %@", contactsArray);
  }];
}

@end
