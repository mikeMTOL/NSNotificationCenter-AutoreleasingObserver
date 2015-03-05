//
//  NSNotificationCenter+AutoreleasingObserver.h
//
//  Created by Mike on 2015-03-01.
//  Copyright (c) 2015 MikeMTOL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NotifcationBlock)(NSNotification* notification);

@interface NSNotificationCenter (AutoreleasingObserver)

-(void)ks_autoreleasingAddObserverForName:(NSString*)name object:(NSObject *)object receiver:(NSObject*)receiver queue:(NSOperationQueue*)queue usingBlock:(NotifcationBlock)block;

@end
