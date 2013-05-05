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

@property (retain, nonatomic) IBOutlet UIImageView *highlightView;

@property (retain, nonatomic) IBOutlet UIImageView *indicator0;
@property (retain, nonatomic) IBOutlet UIImageView *indicator1;
@property (retain, nonatomic) IBOutlet UIImageView *indicator2;
@property (retain, nonatomic) IBOutlet UIImageView *indicator3;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel0;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel1;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel2;
@property (retain, nonatomic) IBOutlet UILabel *updateLabel3;

- (void)selectTabAtIndex:(int)index;
- (id)initWithFrame:(CGRect)frame andBundleName:(NSString *)bundleName andConfigArray:(NSArray *)configArray;

@end



@protocol CustomTabbarDelegate <NSObject>

- (void)customTabbar:(Bee_TabbarItemTmpl*)customTabbar didSelectTab:(int)tabIndex;

@end