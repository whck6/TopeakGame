//
//  ViewController.m
//  test1234
//
//  Created by wenhao on 19/07/2017.
//
//

#import "Weapon.h"
#import "GameInfo.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGPoint location;

@end

@implementation ViewController

- (void)viewWillLayoutSubviews {
    _planeImageView.center = _location;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (id)[UIImage imageNamed:@"background"].CGImage;
    
    GameInfo *gameInfo = [GameInfo sharedGameInfo];
    _costLabel.text = @(gameInfo.bulletCount).stringValue;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameInfoCostChange:) name:GameInfoCostChange object:nil];
    
    _location = self.view.center;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gameInfoCostChange:(NSNotification *)notification {
    GameInfo *gameInfo = [GameInfo sharedGameInfo];
    _costLabel.text = @(gameInfo.bulletCount).stringValue;
}

- (IBAction)dragPlane:(UIPanGestureRecognizer *)gestureRecognizer {
    static CGFloat firstX;
    static CGFloat firstY;
    
    _location = [gestureRecognizer translationInView:self.view];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        firstX = gestureRecognizer.view.center.x;
        firstY = gestureRecognizer.view.center.y;
    }
    
    _location = CGPointMake(firstX + _location.x, firstY + _location.y);
    gestureRecognizer.view.center = _location;
}

- (IBAction)changeWeapon:(id)sender {
    GameInfo *gameInfo = [GameInfo sharedGameInfo];
    [gameInfo changeWeaponWithWeaponType:[sender tag]];
}

- (IBAction)fire:(id)sender {
    NSLog(@"%@", NSStringFromCGRect(_planeImageView.frame));
    
    GameInfo *gameInfo = [GameInfo sharedGameInfo];
    [gameInfo reduceCost];
    
    UIImage *bulletImage = [UIImage imageNamed:gameInfo.currentWeapon.bulletImageName];
    UIImageView *bulletImageView = [[UIImageView alloc] initWithImage:bulletImage];
    bulletImageView.frame = CGRectMake(_planeImageView.center.x - bulletImage.size.width / 2.0, _planeImageView.frame.origin.y - bulletImage.size.height, bulletImage.size.width, bulletImage.size.height);
    [self.view addSubview:bulletImageView];
    
    CABasicAnimation *bulletAnimation = [CABasicAnimation animation];
    bulletAnimation.keyPath = @"position.y";
    bulletAnimation.fromValue = @(bulletImageView.frame.origin.y);
    bulletAnimation.toValue = @(0.0 - bulletImage.size.height);
    bulletAnimation.duration = gameInfo.currentWeapon.speed;
    bulletAnimation.fillMode = kCAFillModeForwards;
    bulletAnimation.removedOnCompletion = NO;
    [bulletImageView.layer addAnimation:bulletAnimation forKey:@"basic"];
}

@end
