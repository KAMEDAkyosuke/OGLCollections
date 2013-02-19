//
//  OGLPair.m
//  OGLCollections
//
//  Created by organlounge on 2013/02/19.
//  Copyright (c) 2013年 KAMEDAkyosuke. All rights reserved.
//

#import "OGLPair.h"

@implementation OGLPair

@synthesize first = _first;
@synthesize second = _second;

-(void)dealloc
{
    [_first release];
    [_second release];
    [super dealloc];
}

+(id)pairWithFirst:(id<NSObject, NSCopying>)first second:(id<NSObject, NSCopying>)second
{
    return [[[OGLPair alloc] initWithFirst:first second:second] autorelease];
}

-(id)initWithFirst:(id<NSObject, NSCopying>)first second:(id<NSObject, NSCopying>)second
{
    self = [super init];
    if(self != nil){
        NSAssert([first conformsToProtocol:@protocol(NSCopying)], @"first is not conform NSCopying protocol");
        NSAssert([second conformsToProtocol:@protocol(NSCopying)], @"second is not conform NSCopying protocol");
        SEL copy = @selector(copy);
        NSAssert([first respondsToSelector:copy], @"first is not found '-copy' method");
        NSAssert([second respondsToSelector:copy], @"second is not found '-copy' method");
        _first = [first performSelector:copy];
        _second = [second performSelector:copy];
    }
    return self;
}

- (BOOL) isEqual:(id)other {
    if (other == self) {
        return YES;
    }
    if([other class] != [OGLPair class]){
        return NO;
    }
    else{
        OGLPair *pair = (OGLPair*)other;
        if([pair.first isEqual:_first] && [pair.second isEqual:_second]){
            return YES;
        }
        else{
            return NO;
        }
    }
}

#pragma mark -
#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    OGLPair *clone = [[[self class] allocWithZone:zone]
                      initWithFirst:_first
                      second:_second];
    return clone;
}

@end
