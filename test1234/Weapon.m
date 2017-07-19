//
//  Weapon.m
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import "Bacon.h"
#import "Davincci.h"
#import "Weapon.h"

@implementation Weapon

+ (instancetype)initWithType:(WeaponType)weaponType {
    switch (weaponType) {
        case WeaponTypeA:
            return [[Davincci alloc] initWithCost:1];
            break;
        case WeaponTypeB:
            return [[Bacon alloc] initWithCost:2];
            break;
        case WeaponTypeC:
            return nil;
            break;
    }
}

- (instancetype)initWithCost:(NSUInteger)cost {
    [NSException raise:NSInternalInconsistencyException format:@"not implement this object."];
    return nil;
}

@end
