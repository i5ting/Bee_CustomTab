//
//  TabBarController.h
//  
//
//  Copyright 2012 sina. All rights reserved.
//
#import "CustomTabbar.h"  
#import <UIKit/UIKit.h>


@interface UIViewController(CXTabViewController)

/**
 * 纯为消除warning而加，当tab切换的时候调用此方法
 * optional
 */
-(void)whenTabChanged;

@end


@interface CustomTabBarViewController : UITabBarController<UITabBarControllerDelegate,CustomTabbarDelegate> {
	UIView *_contentView;
    CustomTabbar *_customView; 
    UIImageView *bgView;
    BOOL _isHide;
    NSMutableArray *__controllerArray;
}

@property (retain, nonatomic)CustomTabbar *customView;
@property (assign, nonatomic)BOOL isHidden;

-(id)initWithJSON:(NSString *)json_file_name;
-(id)initWithBundleName:(NSString *)bundle_file_name;

+ (CustomTabBarViewController*)sharedTabBarController;
- (void)selectTab:(int)tabID;
+(BOOL)isHidden;
//获取当前的ViewController
- (UIViewController *)getShowingViewController;

+ (void)hide:(BOOL)bHide animated:(BOOL)bAnimated;

@end
