//
//  NSNotificationCenter+AutoreleasingObserver.m
//
//  Created by Mike on 2015-03-01.
//  Copyright (c) 2015 MikeMTOL. All rights reserved.
//
// Can't remember where i got this SO comment.
// We take advantage of the documented Deallocation Timeline (WWDC 2011, Session 322, 36:22).
// 1. -release to zero
//     * Object is now deallocating and will die.
//     * New __weak references are not allowed, and will get nil.
//     * [self dealloc] is called
// 2. Subclass -dealloc
//     * bottom-most subclass -dealloc is called
//     * Non-ARC code manually releases iVars
//     * Walk the super-class chain calling -dealloc
// 3. NSObject -dealloc
//     * Simply calls the ObjC runtime object_dispose()
// 4. object_dispose()
//     * Call destructors for C++ iVars
//     * Call -release for ARC iVars
//     * Erase associated references
//     * Erase __weak references
//     * Call free()

#import <objc/runtime.h>
#import "NSNotificationCenter+AutoreleasingObserver.h"


const char* ksStoreObjectKey = "ksStoreObjectKey";
const char* ksStoreObjectNotifCenterKey = "ksStoreObjectNotifCenterKey";
@interface ObserverObjectStorage: NSObject
@property (strong,nonatomic) NSObject* objectToStore;
@property (weak,nonatomic) NSNotificationCenter* notifCenter;
@end

@implementation ObserverObjectStorage
-(NSNotificationCenter *)notifCenter
{
    return objc_getAssociatedObject(self, ksStoreObjectNotifCenterKey);
}

-(void)setNotifCenter:(NSNotificationCenter *)notifCenter
{
    objc_setAssociatedObject(self, ksStoreObjectNotifCenterKey, notifCenter, OBJC_ASSOCIATION_ASSIGN);
}

-(NSObject *)objectToStore
{
    return objc_getAssociatedObject(self, ksStoreObjectKey);
}

-(void)setObjectToStore:(NSObject *)objectToStore
{
    objc_setAssociatedObject(self, ksStoreObjectKey, objectToStore, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)dealloc
{
    [self.notifCenter removeObserver:self.objectToStore];
}
@end

const char* ksAutoreleasingObserverObjectKey = "ksAutoreleasingObserverObjectKey";
@implementation NSNotificationCenter (AutoreleasingObserver)

-(void)ks_autoreleasingAddObserverForName:(NSString*)name object:(NSObject *)object receiver:(NSObject*)receiver queue:(NSOperationQueue*)queue usingBlock:(__weak NotifcationBlock)block
{
    NSObject* o = [self addObserverForName:name object:object queue:queue usingBlock:block];
    
    ObserverObjectStorage* storage = [[ObserverObjectStorage alloc]init];
    storage.notifCenter = self;
    storage.objectToStore = o;
    
    objc_setAssociatedObject(receiver, ksAutoreleasingObserverObjectKey, storage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
