//
//  DataModel.h
//  collectionInTableCode
//
//  Created by Michael on 6/3/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *data;

- (void)startUp;
- (BOOL) add:(NSObject *)newObject;
- (void) deteleLast;
- (void) deleteFirst;
- (void) removeAt:(int)x;
- (void) deleteAll;
- (id) objectAt:(int)x;
- (int) size;


@end
