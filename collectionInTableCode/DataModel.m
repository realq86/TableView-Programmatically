//
//  DataModel.m
//  collectionInTableCode
//
//  Created by Michael on 6/3/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel


- (void) startUp{
    self.data = [[NSMutableArray alloc] init];
    
}

- (BOOL) add:(NSObject *)newObject{
    
    if(newObject){
        [self.data addObject:newObject];
        return YES;
    }
    else
        return NO;
}

- (id) objectAt:(int)x{
    return [self.data objectAtIndex:x];
}

- (void) deteleLast{
    [self.data removeLastObject];
}

- (void) deleteFirst{
    [self.data removeObjectAtIndex:0];
}


- (void) removeAt:(int)x{
    if(x < [self.data count])
    [self.data removeObjectAtIndex:x];
}


- (void) deleteAll{
    [self.data removeAllObjects];
}

- (int) size{
    return (int)[self.data count];
}




@end
