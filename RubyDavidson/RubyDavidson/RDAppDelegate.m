//
//  RDAppDelegate.m
//  RubyDavidson
//
//  Created by AndrewShmig on 10/6/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "RDAppDelegate.h"

@implementation RDAppDelegate
{
    NSManagedObjectModel *_managedObjectModel;
    NSManagedObjectContext *_managedObjectContext;
    NSPersistentStoreCoordinator *_coordinator;
}

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

//    Book *book1 = [NSEntityDescription insertNewObjectForEntityForName:@"Book"
//                                                inManagedObjectContext:[self managedObjectContext]];
//    
//    book1.name = @"Hello World!";
//    book1.pages = @100;
//    book1.year = @2009;

    NSManagedObjectContext *context = [self managedObjectContext];

    NSLog(@"Before");

    [context RD_helloWorld];

    NSLog(@"After");

//    [context RD_createBookWithName:@"Hello World!" pages:@100 andYear:@2009];

    [[self managedObjectContext] save:nil];

    return YES;
}

#pragma mark - Core Data Stack

- (NSManagedObjectModel *)managedObjectModel
{
    if (nil != _managedObjectModel)
        return _managedObjectModel;

    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];

    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)coordinator
{
    if (nil != _coordinator)
        return _coordinator;

    NSURL *storeURL = [[[[NSFileManager defaultManager]
                                        URLsForDirectory:NSDocumentDirectory
                                               inDomains:NSUserDomainMask]
                                        lastObject]
                                        URLByAppendingPathComponent:@"Model.sqlite"];

    _coordinator = [[NSPersistentStoreCoordinator alloc]
                                                   initWithManagedObjectModel:self.managedObjectModel];

    NSError *error = nil;
    if (![_coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                    configuration:nil
                                              URL:storeURL
                                          options:nil
                                            error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    return _coordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (nil != _managedObjectContext)
        return _managedObjectContext;

    NSPersistentStoreCoordinator *storeCoordinator = self.coordinator;

    if (nil != storeCoordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:storeCoordinator];
    }

    return _managedObjectContext;
}

@end