//
//  TabBarController.h
//
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "RootViewController.h"
#import "sssViewController.h"
#import "JSONKit.h"

#define TAB_CONTROLLER_TAB_HIDDEN_Y 480.0f
#define TAB_CONTROLLER_TAB_VISIBLE_Y 436.0f
#define TAB_CONTROLLER_TAB_HEIGHT 44.0f



@interface CustomTabBarViewController()
- (void)hideTabBar;
- (void)addCustomElements;
- (void)offlineDownload;
- (void)hide:(BOOL)hidden withAnimation:(BOOL)isAnimation;
@end 


@implementation UIViewController(CXTabViewController)

-(void)whenTabChanged{
    
}

@end


@implementation CustomTabBarViewController
@synthesize customView = _customView;
@synthesize isHidden = _isHide;
static CustomTabBarViewController *_tabBarInstance;

+(BOOL)isHidden
{
    return _tabBarInstance.isHidden;
}

+ (CustomTabBarViewController*)sharedTabBarController{
	return _tabBarInstance;
}
+ (void)hide:(BOOL)bHide animated:(BOOL)bAnimated{
    [_tabBarInstance hide:bHide withAnimation:bAnimated];
    _tabBarInstance.isHidden = bHide;
}

#pragma mark - CustomTabBarDelegate
- (void)customTabbar:(CustomTabbar*)customTabbar didSelectTab:(int)tabIndex{
    //    [customTabbar selectTabAtIndex:tabIndex];
    //    self.selectedIndex = tabIndex;
    [self selectTab:tabIndex];

    /**
     * 当切换tab的时候，让CXPopoverView消失，选中按钮取消高亮，所有内容在whenClear方法里实现
     */
    if ([self getShowingViewController] && [[self getShowingViewController] respondsToSelector:@selector(whenTabChanged)]) {
        [(UIViewController *)[self getShowingViewController] whenTabChanged];
    }    
}

#pragma mark - private methods
- (void)hideTabBar{
	if ([[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] ) {
		_contentView = [self.view.subviews objectAtIndex:1];
	}
	else {
		_contentView = [self.view.subviews objectAtIndex:0];
	}
	_contentView.frame = CGRectMake(0, 0, 320, 480);
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.alpha = 0;
			break;
		}
	}
}

- (UIViewController *)getShowingViewController
{
    UINavigationController *currentNavController =  (UINavigationController *)self.selectedViewController;
    return currentNavController.visibleViewController;
}

- (void)addCustomElements{
    if (__controllerArray == nil) {
        return;
    }
    _customView = [[CustomTabbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44) andConfigArray:__controllerArray];
    [_customView selectTabAtIndex:0];
    _customView.delegate = self;
    _customView.frame = CGRectMake(0, TAB_CONTROLLER_TAB_VISIBLE_Y, 320, TAB_CONTROLLER_TAB_HEIGHT);
    [self.view addSubview:_customView];
    [self selectTab:0];
}

-(void)hide:(BOOL)hidden withAnimation:(BOOL)isAnimation{
	CGFloat durTime = 0;
	if (isAnimation) {
		durTime = 0.5f;
	}
    
	if (hidden) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:durTime];
        bgView.frame = CGRectMake(0, TAB_CONTROLLER_TAB_HIDDEN_Y, 320, 59);;
        _customView.frame = CGRectMake(_customView.frame.origin.x, TAB_CONTROLLER_TAB_HIDDEN_Y, _customView.frame.size.width, _customView.frame.origin.y);
		[UIView commitAnimations];
	}else {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:durTime];        
        bgView.frame = CGRectMake(0, TAB_CONTROLLER_TAB_VISIBLE_Y, 320, 59);;
        _customView.frame = CGRectMake(_customView.frame.origin.x, TAB_CONTROLLER_TAB_VISIBLE_Y, _customView.frame.size.width, _customView.frame.origin.y);
		[UIView commitAnimations];
	}
}

#pragma mark - public methods
- (void)selectTab:(int)tabID{
    NSLog(@"tabID=%d",tabID);
   
    if (self.selectedIndex == tabID) {
		UINavigationController *navController = (UINavigationController *)[self selectedViewController];
		[navController popToRootViewControllerAnimated:YES];
	} else {
		self.selectedIndex = tabID;
        [_customView selectTabAtIndex:tabID];
	}
//    if ([[[TabBarController sharedTabBarController] getShowingViewController] isKindOfClass:[TopicNewsViewController class]]) {
//        [(TopicNewsViewController *)[[TabBarController sharedTabBarController] getShowingViewController] resetTableCellColor];
//    }
  
}

#pragma mark - lifecycle methods
- (id)init{
    self =[super init];
    _tabBarInstance = self;
	if (self) {
		self.delegate = self;
        bgView = [UIImageView new];
        bgView.frame = CGRectMake(0, TAB_CONTROLLER_TAB_VISIBLE_Y, 320, 59);;
        
        bgView.image = [UIImage imageNamed:@"CustomTabBar.bundle/tab_bg_0227.png"];
        [self.view insertSubview:bgView belowSubview:_customView];
        
        
        NSMutableArray *_controllersArray = [NSMutableArray array];
        
        for (NSDictionary *d in  __controllerArray) {
            id _myViewController = [[NSClassFromString((NSString *)[d objectForKey:@"controllerName"]) alloc] init];
            UINavigationController *topicNavigationController = [[[UINavigationController alloc] initWithRootViewController:_myViewController] autorelease];
            topicNavigationController.navigationBar.hidden = YES;
            [_controllersArray addObject:topicNavigationController];
        }
        
        
        
//        RootViewController *topicNewsViewController = [[[RootViewController alloc] init] autorelease];
//        UINavigationController *topicNavigationController = [[[UINavigationController alloc] initWithRootViewController:topicNewsViewController] autorelease];
//        topicNavigationController.navigationBar.hidden = YES;
//        
//        sssViewController *opnionViewController = [[[sssViewController alloc] init] autorelease];
//        UINavigationController *opnionNavigationController = [[[UINavigationController alloc] initWithRootViewController:opnionViewController] autorelease];
//        opnionNavigationController.navigationBar.hidden = YES;
//        
//        RootViewController *visionsViewController = [[[RootViewController alloc] init] autorelease];
//        UINavigationController *visionsNavigationController = [[[UINavigationController alloc] initWithRootViewController:visionsViewController] autorelease];
//        visionsNavigationController.navigationBar.hidden = YES;
//        
//        RootViewController *updatesViewController = [[[RootViewController alloc] init] autorelease];
//        UINavigationController *updatesNavigationController = [[[UINavigationController alloc] initWithRootViewController:updatesViewController] autorelease];
//        updatesNavigationController.navigationBar.hidden = YES;
//        
//        RootViewController *allTheViewController = [[[RootViewController alloc] init] autorelease];
//        UINavigationController *allTheNavigationController = [[[UINavigationController alloc] initWithRootViewController:allTheViewController] autorelease];
//        allTheNavigationController.navigationBar.hidden = YES;
        
        __controllerArray = _controllersArray;
        [self setViewControllers:_controllersArray];
    }
	return self;
}

-(id)initWithBundleName:(NSString *)bundle_file_name{
    if (self = [super init]) {
        NSString *json_file_name;
        if ([bundle_file_name hasSuffix:@"bundle"]) {
            json_file_name = [NSString stringWithFormat:@"%@/tab.config.json",bundle_file_name];
        }else{
            json_file_name = [NSString stringWithFormat:@"%@.bundle/tab.config.json",bundle_file_name];
        }
        
        self = [self initWithJSON:json_file_name];
    }
    return self;
}

-(id)initWithJSON:(NSString *)json_file_name{
    if (self = [super init]) {
        
  
        [self getConfigInfo:json_file_name];
        
        self = [self init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	[self hideTabBar];	
	[self addCustomElements];
}

- (void)viewDidUnload
{
    [_customView release];
    _customView = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    RELEASE_SAFELY(_customView);
    RELEASE_SAFELY(bgView);
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

- (BOOL)shouldAutorotate{
    //     if([ShareData sharedManager].isStockItemView && [ShareData sharedManager].viewIsLoading == NO){
    //         return YES;
    //     }else{
    return YES;
    //     }
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)getConfigInfo:(NSString *)json_file_name{
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString* emotionFile = [bundlePath stringByAppendingPathComponent:json_file_name];
    NSError* error;
    NSString* commentStr = [NSString stringWithContentsOfFile:emotionFile encoding:NSUTF8StringEncoding error:&error];
    if (!commentStr) {
        commentStr = [NSString stringWithContentsOfFile:emotionFile encoding:NSUnicodeStringEncoding error:&error];
    }
    NSDictionary *cemotionArray = [commentStr objectFromJSONString];
    
    
    __controllerArray = [cemotionArray objectForKey:@"btns"];
}

@end
