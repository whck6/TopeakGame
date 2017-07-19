//
//  GameInfo.m
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import "Weapon.h"
#import "GameInfo.h"

NSString *const GameInfoCostChange = @"GameInfoCostChange";

@implementation GameInfo

+ (instancetype)sharedGameInfo {
    static dispatch_once_t onceToken;
    static GameInfo *gameInfo;
    dispatch_once(&onceToken, ^{
        gameInfo = [[GameInfo alloc] initWithBulletCount:100];
    });
    
    return gameInfo;
}

- (instancetype)initWithBulletCount:(NSUInteger)bulletCount {
    self = [super init];
    if (self) {
        _bulletCount = bulletCount;
        _currentWeapon = [Weapon initWithType:WeaponTypeA];
    }
    
    return self;
}

- (void)changeWeaponWithWeaponType:(WeaponType)weaponType {
    if (weaponType == WeaponTypeA) {
        _currentWeapon = [Weapon initWithType:WeaponTypeA];
    } else if (weaponType == WeaponTypeB) {
        _currentWeapon = [Weapon initWithType:WeaponTypeB];
    }
}

- (void)reduceCost {
    _bulletCount -= _currentWeapon.cost;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:GameInfoCostChange object:nil];
}

@end
