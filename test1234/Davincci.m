//
//  Davincci.m
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import "Davincci.h"

@interface Davincci ()

@property (nonatomic, assign, readwrite) NSUInteger cost;
@property (nonatomic, assign, readwrite) NSTimeInterval speed;
@property (nonatomic, copy, readwrite) NSString *bulletImageName;

@end

@implementation Davincci
@synthesize cost = _cost;
@synthesize speed = _speed;
@synthesize bulletImageName = _bulletImageName;

- (instancetype)initWithCost:(NSUInteger)cost {
    _cost = cost;
    _speed = 1.0;
    _bulletImageName = @"missile1";
    return self;
}

@end
