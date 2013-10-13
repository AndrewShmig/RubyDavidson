(проект умер)

#RubyDavidson for CoreData

#Creating

````objective-c
[moc RD_createUserWithName:@"John" age:@29 married:@YES];
[moc RD_createCompanyWithName:@"Yandex, LLC" ceo:me managers:@[firstManager, secondManager]];
[moc RD_createCompanyWithName:@"Google" ceos:@[larryPage, sergeyBrin] manager:jonathanGreen];
[moc RD_createBookWithAuthor:joanneRowling name:@"Harry Potter" publishedAt:[NSDate date]];
[moc RD_createTaskForProject:googleTalk priority:@3 members:nil];
[moc RD_createArticleAboutUser:alizar withName:@"Alizar - Habrahabr Soul" andTitle:@"Alizar"];
````
###Pattern:

````
Anpl - attribute name (plural form; first letter - uppercase)
anpl - attribute name (plural form; first letter - lowercase)
^anpl - attribute name (plural form; lowercase if no prefix, uppercase otherwise)

Ans - attribute name (singular form; first letter - uppercase)
ans - attribute name (singular form; first letter - lowercase)
^ans - attribute name (singular form; lowercase if no prefix, uppercase otherwise)

Ens - entity name (singular form; first letter - uppercase)

av - attribute value
````

````
RD_create[Ens][With|For|About][Ans|Anpl]:[av] 
     [[|with|for|about|and][^ans|^anpl]]:[av] ...
````

#Finding

````objective-c
NSArray* mos = [moc RD_findUsersWithFirstName:@"Igori"];
NSManagedObject* mo = [moc RD_findUserWithLastName:@"Guliko" firstName:@"Igori"];

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

###Pattern:

````objective-c
````

#Counting

Replace "find" with "count".
````objective-c
NSUInteger teenagers = [moc RD_countUsersWithAgeBetween:@[@16, @19]];
NSUInteger users = [moc RD_countBooksPublishedBefore:startDate author:joanneRowling readersGreaterThan:@100];
etc.
````

###Pattern:

````objective-c
````

#License

The MIT License (MIT)

Copyright (c) 2013 Andrew Shmig

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.