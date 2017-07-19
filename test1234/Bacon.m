//
//  Bacon.m
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import "Bacon.h"

@interface Bacon ()

@property (nonatomic, assign, readwrite) NSUInteger cost;
@property (nonatomic, assign, readwrite) NSTimeInterval speed;
@property (nonatomic, copy, readwrite) NSString *bulletImageName;

@end

@implementation Bacon
@synthesize cost = _cost;
@synthesize speed = _speed;
@synthesize bulletImageName = _bulletImageName;

- (instancetype)initWithCost:(NSUInteger)cost {
    _cost = cost;
    _speed = 2.0;
    _bulletImageName = @"missile2";
    return self;
}

@end
