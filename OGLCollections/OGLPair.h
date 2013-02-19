//
//  OGLPair.h
//  OGLCollections
//
//  Created by organlounge on 2013/02/19.
//  Copyright (c) 2013年 KAMEDAkyosuke. All rights reserved.
//

@interface OGLPair : NSObject <NSCopying> {
    id<NSObject, NSCopying> _first;
    id<NSObject, NSCopying> _second;
}

@property(nonatomic, readonly)id first;
@property(nonatomic, readonly)id second;

+(id)pairWithFirst:(id<NSObject, NSCopying>)first second:(id<NSObject, NSCopying>)second;
-(id)initWithFirst:(id<NSObject, NSCopying>)first second:(id<NSObject, NSCopying>)second;

@end
