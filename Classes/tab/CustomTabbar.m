//
//  CustomTabbar.m
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import "CustomTabbar.h"

#define CUSTOM_TABBAR_ORIGIN_INSETS UIEdgeInsetsMake(1.0,3.0,3.0,3.0)

@implementation CustomTabbar
@synthesize indicator0;
@synthesize indicator1;
@synthesize indicator2;
@synthesize indicator3;
@synthesize updateLabel0;
@synthesize updateLabel1;
@synthesize updateLabel2;
@synthesize updateLabel3;

@synthesize delegate;
@synthesize newsBtn;
@synthesize opinionBtn;
@synthesize audioVisualBtn;
@synthesize latestBtn;
@synthesize allBtn;
@synthesize highlightView;

- (id)initWithFrame:(CGRect)frame andConfigArray:(NSArray *)configArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        __count = [configArray count];
        UIEdgeInsets originInsets = CUSTOM_TABBAR_ORIGIN_INSETS;
        
        
        int _width = 320/[configArray count];
        
        
        int i = 1;
        
        highlightView = [[UIImageView alloc] init];
        highlightView.frame = CGRectMake(0, 20, 320/5, 29);
        [highlightView setImage:[UIImage imageNamed:@"CustomTabBar.bundle/bglight.png"]];
        
        [self addSubview:highlightView];
        
        for (NSDictionary *d in configArray) {             
            NSString *defaultImg = [NSString stringWithFormat:@"CustomTabBar.bundle/%@",(NSString *)[d objectForKey:@"default"]];
            NSString *selectedImg = [NSString stringWithFormat:@"CustomTabBar.bundle/%@",(NSString *)[d objectForKey:@"selected"]];
            
          UIButton  *_newsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _newsBtn.tag = 10357+i;
            _newsBtn.frame = CGRectMake(_width*(i - 1), 0, _width, 49);
            [_newsBtn setImage:[UIImage imageNamed:defaultImg] forState:UIControlStateNormal];
            [_newsBtn setImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
            [_newsBtn setOpaque:NO];
            _newsBtn.contentEdgeInsets = originInsets;
            
            i++;
            
             [_newsBtn addTarget:self action:@selector(tapOnNewsBtn:) forControlEvents:UIControlEventTouchUpInside];
            
        
            [self addSubview:_newsBtn];
            
            
//            indicator0 = [[UIImageView alloc] initWithFrame:CGRectMake(31, -3, 33, 24)];
//            [indicator0 setImage:[UIImage imageNamed:@"CustomTabBar.bundle/indicator.png"]];
//             [indicator0 setOpaque:YES];
//            [indicator0 setHidden:YES];
//            [indicator0 clearsContextBeforeDrawing];
//            [self addSubview:indicator0];
        }

//        indicator1= [[UIImageView alloc] initWithFrame:CGRectMake(95, -3, 33, 24)];
//        indicator2= [[UIImageView alloc] initWithFrame:CGRectMake(159, -3, 33, 24)];
//        indicator3= [[UIImageView alloc] initWithFrame:CGRectMake(223, -3, 33, 24)];
        
 
        
//        updateLabel0 = [[UILabel alloc] initWithFrame:CGRectMake(38, 3, 20, 12)];
//        updateLabel1= [[UILabel alloc] initWithFrame:CGRectMake(102, 3, 20, 12)];
//        updateLabel2= [[UILabel alloc] initWithFrame:CGRectMake(166, 3, 20, 12)];
//        updateLabel3= [[UILabel alloc] initWithFrame:CGRectMake(228, 3, 23, 12)];
//   
//        [updateLabel1 setBackgroundColor:[UIColor clearColor]];
//        [updateLabel2 setBackgroundColor:[UIColor clearColor]];
//        [updateLabel3 setBackgroundColor:[UIColor clearColor]];
//        
//        [updateLabel1 setTextColor:[UIColor whiteColor]];
//        [updateLabel2 setTextColor:[UIColor whiteColor]];
//        [updateLabel3 setTextColor:[UIColor whiteColor]];
//        
//        [updateLabel1 setFont:[UIFont systemFontOfSize:12]];
//        [updateLabel2 setFont:[UIFont systemFontOfSize:12]];
//        [updateLabel3 setFont:[UIFont systemFontOfSize:10]];
//        
//        [updateLabel1 setTextAlignment:UITextAlignmentCenter];
//        [updateLabel2 setTextAlignment:UITextAlignmentCenter];
//        [updateLabel3 setTextAlignment:UITextAlignmentCenter];
// 
//        
////        [updateLabel0 setHidden:YES];
//        [updateLabel1 setHidden:YES];
//        [updateLabel2 setHidden:YES];
//        [updateLabel3 setHidden:YES];
//        
//        [updateLabel1 autoresizesSubviews];
//        [updateLabel2 autoresizesSubviews];
//        [updateLabel3 autoresizesSubviews];
//
////        [updateLabel0 clearsContextBeforeDrawing];
//        [updateLabel1 clearsContextBeforeDrawing];
//        [updateLabel2 clearsContextBeforeDrawing];
//        [updateLabel3 clearsContextBeforeDrawing];
//        
////        [self addSubview:updateLabel0];
//        [self addSubview:updateLabel1];
//        [self addSubview:updateLabel2];
//        [self addSubview:updateLabel3];
    }
    return self;
}

- (void)sss:(int)index{

    for (int i = 0; i < __count; i++) {
        UIButton *_cur_btn = (UIButton *)[self viewWithTag:10358+i];
        if (_cur_btn == nil) {
            return;
        }
        if (i == index) {
            _cur_btn.selected = YES;
            [_cur_btn setBackgroundImage:[UIImage imageNamed:@"CustomTabBar.bundle/bglight.png"] forState:UIControlStateSelected];
        }else{
            _cur_btn.selected = NO;
        }
        
    }
    
}

- (void)selectTabAtIndex:(int)index
{
    for (int i; i < __count; i++) {
        UIButton *_cur_btn = (UIButton *)[self viewWithTag:10358+i];
        if (_cur_btn == nil) {
            return;
        }
        if (i != index) {
            _cur_btn.selected = NO;
        }else{
        
        }
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];

        CGRect f = self.highlightView.frame;
        f.origin.x = index * self.highlightView.frame.size.width;
        self.highlightView.frame = f;
        
    }completion: ^(BOOL finished){
        [self sss:index];
    }];
    
    [UIView commitAnimations];
    //[NSThread sleepForTimeInterval:0.2];
}

- (void)tapOnNewsBtn:(UIButton *)sender {
    if (delegate && [delegate respondsToSelector:@selector(customTabbar:didSelectTab:)]) {
        int i = sender.tag - 10358;
        NSLog(@"【 tapOnNewsBtn 】 current tag :=%d",i);
        [delegate customTabbar:self didSelectTab:i];
    }
    self.indicator0.hidden = YES;
    self.updateLabel0.hidden = YES;
}

- (void)dealloc {
    [newsBtn release];
    [opinionBtn release];
    [audioVisualBtn release];
    [latestBtn release];
    [allBtn release];
    [highlightView release];
    [indicator0 release];
    [indicator1 release];
    [indicator2 release];
    [indicator3 release];
    [updateLabel0 release];
    [updateLabel1 release];
    [updateLabel2 release];
    [updateLabel3 release];
    [super dealloc];
}
@end
