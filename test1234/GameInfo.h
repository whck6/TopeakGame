//
//  GameInfo.h
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import <Foundation/Foundation.h>

extern NSString *const GameInfoCostChange;

@class Weapon;

@interface GameInfo : NSObject

@property (nonatomic, assign, readonly) NSUInteger bulletCount;

@property (nonatomic, readonly) Weapon *currentWeapon;

+ (instancetype)sharedGameInfo;

- (instancetype)initWithBulletCount:(NSUInteger)bulletCount;

- (void)changeWeaponWithWeaponType:(WeaponType)weaponType;

- (void)reduceCost;

@end
