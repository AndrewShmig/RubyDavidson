//
//  RDAppDelegate.h
//  RubyDavidson
//
//  Created by AndrewShmig on 10/6/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "NSManagedObjectContext+RubyDavidson.h"

@interface RDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *coordinator;

@end