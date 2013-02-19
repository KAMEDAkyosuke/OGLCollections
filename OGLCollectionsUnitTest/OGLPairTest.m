//
//  OGLPairTest.m
//  OGLCollections
//
//  Created by organlounge on 2013/02/19.
//  Copyright (c) 2013年 KAMEDAkyosuke. All rights reserved.
//

#import "OGLPairTest.h"

#import "OGLPair.h"

@interface DisableNSCopying : NSObject
@end

@implementation DisableNSCopying
@end

@implementation OGLPairTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInit
{
    {// initWithFirst
        OGLPair *pair = [[[OGLPair alloc] initWithFirst:@"first"
                                                 second:@"second"] autorelease];
        STAssertEqualObjects(@"first", pair.first, @"pair.first not same");
        STAssertEqualObjects(@"second", pair.second, @"pair.second not same");
    }
    {// pairWithFirst
        OGLPair *pair = [OGLPair pairWithFirst:@"first" second:@"second"];
        STAssertEqualObjects(@"first", pair.first, @"pair.first not same");
        STAssertEqualObjects(@"second", pair.second, @"pair.second not same");
    }
}

-(void) testDisableNSCopying
{
    DisableNSCopying* obj = [[[DisableNSCopying alloc] init] autorelease];
    @try {
        [[[OGLPair alloc] initWithFirst:obj
                                 second:@"second"] autorelease];
        STFail(@"Check confirm NSCopying protocol is fail");
    }
    @catch (NSException *exception) {
        STAssertEqualObjects(@"NSInternalInconsistencyException", exception.name, @"unexpected exception");
    }
    
    @try {
        [[[OGLPair alloc] initWithFirst:@"first"
                                 second:obj] autorelease];
        STFail(@"Check confirm NSCopying protocol is fail");
    }
    @catch (NSException *exception) {
        STAssertEqualObjects(@"NSInternalInconsistencyException", exception.name, @"unexpected exception");
    }
}
-(void) testNSCopying
{
    OGLPair *pair = [[[OGLPair alloc] initWithFirst:@[@"first"]
                                             second:@[@"second"]] autorelease];
    OGLPair *clone = [pair copy];
    STAssertEqualObjects(pair.first, clone.first, @"not same");
    STAssertEqualObjects(pair.second, clone.second, @"not same");
}

@end
