//
//  TabBarController.h
//  
//
//  Copyright 2012 sina. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Bee_TabbarItemTmpl.h"
#import "Bee_TabbarItem1.h"
@interface UIViewController(CXTabViewController)

/**
 * 纯为消除warning而加，当tab切换的时候调用此方法
 * optional
 */
-(void)whenTabChanged;

@end


@interface CustomTabBarViewController : UITabBarController<UITabBarControllerDelegate,CustomTabbarDelegate> {
	UIView *_contentView;
    Bee_TabbarItemTmpl *_customView; 
    UIImageView *bgView;
    BOOL _isHide;
    NSMutableArray *__controllerArray;
    NSDictionary *__configDict;
    NSString *__bundleName;
}

@property (retain, nonatomic)Bee_TabbarItemTmpl *customView;
@property (assign, nonatomic)BOOL isHidden;
@property (assign, nonatomic)BOOL logTrace;

-(id)initWithJSON:(NSString *)json_file_name;
-(id)initWithBundleName:(NSString *)bundle_file_name;

+ (CustomTabBarViewController*)sharedTabBarController;
- (void)selectTab:(int)tabID;
+(BOOL)isHidden;
//获取当前的ViewController
- (UIViewController *)getShowingViewController;

+ (void)hide:(BOOL)bHide animated:(BOOL)bAnimated;

@end
