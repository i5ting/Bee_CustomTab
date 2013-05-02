//
//  CustomTabbar.h
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomTabbarDelegate;

@interface CustomTabbar : UIView
{
    int __count;
}

@property (nonatomic, assign) id<CustomTabbarDelegate> delegate;
@property (retain, nonatomic) IBOutlet UIButton *newsBtn;
@property (retain, nonatomic) IBOutlet UIButton *opinionBtn;
@property (retain, nonatomic) IBOutlet UIButton *audioVisualBtn;
@property (retain, nonatomic) IBOutlet UIButton *latestBtn;
@property (retain, nonatomic) IBOutlet UIButton *allBtn;
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
- (id)initWithFrame:(CGRect)frame andConfigArray:(NSArray *)configArray;

@end

@protocol CustomTabbarDelegate <NSObject>

- (void)customTabbar:(CustomTabbar*)customTabbar didSelectTab:(int)tabIndex;

@end
