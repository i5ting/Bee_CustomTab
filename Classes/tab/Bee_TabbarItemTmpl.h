//
//  Bee_TabbarItemTmpl.h
//  SimpleEKDemo
//
//  Created by sang alfred on 5/5/13.
//
//

#import <UIKit/UIKit.h>
 

@protocol CustomTabbarDelegate;

@interface Bee_TabbarItemTmpl : UIView
{
    int __count;
}

@property (nonatomic, assign) id<CustomTabbarDelegate> delegate;

// _customView = [[Bee_TabbarItem1 alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andBundleName:__bundleName andConfigArray:__controllerArray];

@property (assign, nonatomic) CGRect viewframe;
@property (strong, nonatomic) NSArray *configArray;
@property (strong, nonatomic) NSString *bundleName;

@property (strong, nonatomic) UIImageView *highlightView;

@property (strong, nonatomic) UIImageView *indicator0;
@property (strong, nonatomic) UIImageView *indicator1;
@property (strong, nonatomic) UIImageView *indicator2;
@property (strong, nonatomic) UIImageView *indicator3;
@property (strong, nonatomic) UILabel *updateLabel0;
@property (strong, nonatomic) UILabel *updateLabel1;
@property (strong, nonatomic) UILabel *updateLabel2;
@property (strong, nonatomic) UILabel *updateLabel3;


-(void)showTab;
- (void)selectTabAtIndex:(int)index;
- (id)initWithFrame:(CGRect)frame andBundleName:(NSString *)bundleName andConfigArray:(NSArray *)configArray;

@end



@protocol CustomTabbarDelegate <NSObject>

- (void)tap_on_btn_call_back:(int)index;

- (void)draw_with_dict:(NSDictionary *)d in_container:(UIView *)view;


- (void)customTabbar:(Bee_TabbarItemTmpl*)customTabbar didSelectTab:(int)tabIndex;

@end