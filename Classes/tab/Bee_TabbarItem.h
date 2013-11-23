//
//  Bee_TabbarItem.h
//  SimpleEKDemo
//
//  Created by sang on 5/3/13.
//
//

#import <UIKit/UIKit.h>

@protocol CustomTabbarDelegate;

@interface Bee_TabbarItem : UIView
{
    int __count;
}

@property (nonatomic, weak) id<CustomTabbarDelegate> delegate;
@property (strong, nonatomic) UIButton *newsBtn;

@property (strong, nonatomic) UIImageView *highlightView;

@property (strong, nonatomic) UIImageView *indicator0;
@property (strong, nonatomic) UIImageView *indicator1;
@property (strong, nonatomic) UIImageView *indicator2;
@property (strong, nonatomic) UIImageView *indicator3;
@property (strong, nonatomic) UILabel *updateLabel0;
@property (strong, nonatomic) UILabel *updateLabel1;
@property (strong, nonatomic) UILabel *updateLabel2;
@property (strong, nonatomic) UILabel *updateLabel3;

- (void)selectTabAtIndex:(int)index;
- (id)initWithFrame:(CGRect)frame andBundleName:(NSString *)bundleName andConfigArray:(NSArray *)configArray;

@end



@protocol CustomTabbarDelegate <NSObject>

- (void)customTabbar:(Bee_TabbarItem*)customTabbar didSelectTab:(int)tabIndex;

@end