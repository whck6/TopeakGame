//
//  Weapon.h
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WeaponType) {
    WeaponTypeA,
    WeaponTypeB,
    WeaponTypeC
};

@protocol WeaponProtocol <NSObject>

- (instancetype)initWithCost:(NSUInteger)cost;

@end

@interface Weapon : NSObject <WeaponProtocol>

@property (nonatomic, assign, readonly) NSUInteger cost;

@property (nonatomic, assign, readonly) NSTimeInterval speed;

@property (nonatomic, copy, readonly) NSString *bulletImageName;

+ (instancetype)initWithType:(WeaponType)weaponType;

@end
