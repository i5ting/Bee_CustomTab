//
//  Bee_TabbarItem.m
//  SimpleEKDemo
//
//  Created by sang on 5/3/13.
//
//

#import "Bee_TabbarItem.h"
 

#define CUSTOM_TABBAR_ORIGIN_INSETS UIEdgeInsetsMake(1.0,3.0,3.0,3.0)

@implementation Bee_TabbarItem


@synthesize highlightView;

- (id)initWithFrame:(CGRect)frame andBundleName:(NSString *)bundleName andConfigArray:(NSArray *)configArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        __count = [configArray count];
        UIEdgeInsets originInsets = CUSTOM_TABBAR_ORIGIN_INSETS;
        
        
        int _width = 320/[configArray count];
        
        
        int i = 1;
        
        highlightView = [[UIImageView alloc] init];
        highlightView.frame = CGRectMake(0, 20, 320/5, 29);
        
        [highlightView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@/%@",bundleName,@"bglight.png"]]];
        
        [self addSubview:highlightView];
        
        for (NSDictionary *d in configArray) {
            NSString *defaultImg = [NSString stringWithFormat:@"%@/%@",bundleName,(NSString *)[d objectForKey:@"default"]];
            NSString *selectedImg = [NSString stringWithFormat:@"%@/%@",bundleName,(NSString *)[d objectForKey:@"selected"]];
            
            _newsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _newsBtn.tag = 10357+i;
            _newsBtn.frame = CGRectMake(_width*(i - 1), 0, _width, 49);
            [_newsBtn setImage:[UIImage imageNamed:defaultImg] forState:UIControlStateNormal];
            [_newsBtn setImage:[UIImage imageNamed:selectedImg] forState:UIControlStateSelected];
            [_newsBtn setOpaque:NO];
            _newsBtn.contentEdgeInsets = originInsets;
            
            i++;
            
            [_newsBtn addTarget:self action:@selector(tapOnNewsBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [self addSubview:_newsBtn];
            
        }
        
        
    }
    return self;
}

- (void)setSelected:(int)index{
    
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
        [self setSelected:index];
    }];
    
    [UIView commitAnimations];
    //[NSThread sleepForTimeInterval:0.2];
}

- (void)tapOnNewsBtn:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(customTabbar:didSelectTab:)]) {
        int i = sender.tag - 10358;
        NSLog(@"【 tapOnNewsBtn 】 current tag :=%d",i);
        [_delegate customTabbar:self didSelectTab:i];
    }
    
    self.indicator0.hidden = YES;
    self.updateLabel0.hidden = YES;
}

- (void)dealloc {
//    [newsBtn release];
//    
//    [highlightView release];
//    [indicator0 release];
//    [indicator1 release];
//    [indicator2 release];
//    [indicator3 release];
//    [updateLabel0 release];
//    [updateLabel1 release];
//    [updateLabel2 release];
//    [updateLabel3 release];
//    [super dealloc];
}
@end
