# APContact-EasyMapping
Category to easily map APContact model with EasyMapping

# Installation

Add the three folowing pods to your `Podfile`:

```objc
pod 'APAddressBook'
pod 'EasyMapping'
pod 'APContactEasyMapping'
```

# Usage

Add the following include: 

```objc
#import <APAddressBook/AddressBook.h>
#import <EasyMapping/EasyMapping.h>
#import "APContact+EasyMapping.h"
```

Example: 

```objc
APAddressBook *addressBook = [[APAddressBook alloc] init];

addressBook.fieldsMask = APContactFieldAll;

[addressBook loadContacts:^(NSArray<APContact *> * _Nullable contacts, NSError * _Nullable error) {
  NSMutableArray *serializedContacts = [NSMutableArray array];
  
  for (APContact *contact in contacts) {
    [serializedContacts addObject:[contact serializeToDictionary]];
  }
}];
```
