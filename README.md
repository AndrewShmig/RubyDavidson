RubyDavidson for CoreData
=======================

**Creating**

Examples:
````objective-c
NSManagedObject* mo = [moc RD_createUserWithName:@"John" age:@29 married:@YES];
NSManagedObject* mo = [moc RD_createCompanyWithName:@"Yandex, LLC" ceo:me managers:@[firstManager, secondManager]];
NSManagedObject* mo = [moc RD_createCompanyWithName:@"Google" ceos:@[larryPage, sergeyBrin] manager:jonathanGreen];
NSManagedObject* mo = [moc RD_createBookWithAuthor:joanneRowling name:@"Harry Potter" publishedAt:[NSDate date]];
````

Pattern:
````objective-c
RD_create[entity name]With[attribute name]:[attribute value] [attribute name]:[attribute value] ...
````

**Finding**

Examples:
````objective-c
NSManagedObject* mo = [moc RD_findUsersWithFirstName:@"Igori"];
NSArray* mos = [moc RD_findUserWithLastName:@"Guliko" firstName:@"Igori"];

NSArray* mos = [moc RD_findBooksPublishedAt:[NSDate date]];
NSArray* mos = [moc RD_findFriendsLastSeenAt:[NSDate date]];
NSArray* mos = [moc RD_findBooksPublishedAfter:[NSDate date]];
NSArray* mos = [moc RD_findBooksPublishedBefore:[NSDate date]];
NSManagedObject* mo = [moc RD_findStudentCreatedBefore:[NSDate date] emailLike:@"*@gmail.com"];
NSArray* mos = [moc RD_findCompaniesRegisteredAfter:[NSDate date] limit:@10 offset:@1];
NSArray* mos = [moc RD_findClientsAddedBetween:@[startDate, endDate]];

NSArray* mos = [moc RD_findStudentsWithAgeBetween:@[@18, @28]]; // plural
NSManagedObject *mo = [moc RD_findStudentWithAgeBetween:@[@18, @28]]; // singular
NSArray* mos = [moc RD_findUsersWithGender:@[@"Male", @"Female"] lastNameLike:@"*ir*" ageBetween:@[@18, @29]];
NSArray* mos = [moc RD_findCarsWithFuelVolumeGreaterThan:@10];
NSArray* mos = [moc RD_findMessagesWithPositiveVotesSmallerThan:@29];
````

**Counting**

Replace "find" with "count".

Examples:
````objective-c
NSUInteger teenagers = [moc countUsersWithAgeBetween:@[@16, @19]];
NSUInteger users = [moc countBooksPublishedBefore:startDate author:joanneRowling readersGreaterThan:@100];
etc.
````

[iOS] Ruby like dynamic finders for Core Data
