//
//  CustomerTab.h
//  SimpleEKDemo
//
//  Created by sang on 10/17/12.
//
//

#ifndef SimpleEKDemo_CustomerTab_h
#define SimpleEKDemo_CustomerTab_h

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]
#define ImageInitNamed(_pointer) [UIImage imageNamed:[UIUtil initWithName:_pointer]]
#define isReachability      [[Reachability reachabilityForInternetConnection]isReachable]
#define isWIFIReachability       [[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable
#define is3GReachability    [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable
#define TABBAR_CONTROLLER   [TabBarController sharedTabBarController]
#define PrintRetainCount(__POINTER) //NSLog(@" ** Retain Count ** %s - %@ [%d]", __PRETTY_FUNCTION__, __POINTER, [__POINTER retainCount])
#define AssertReleased(__POINTER) //if([__POINTER retainCount] > 0){ NSLog(@"!!! possible memory leak !!! %s - %@ (retain count:[%d])", __PRETTY_FUNCTION__, __POINTER, [__POINTER retainCount]);}
#define MarkReleased() //NSLog(@"releasing %s - %@", __PRETTY_FUNCTION__, self);

// Release methods
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }
#define AUTORELEASE_SAFELY(__POINTER) { [__POINTER autorelease]; __POINTER = nil; }

// util methods
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// Color helpers
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define OC(str) [NSString stringWithCString:(str) encoding:NSUTF8StringEncoding]


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define UI_MAX_HEIGHT [UIScreen mainScreen].bounds.size.height



//兼容ios6，旋转相关的新增api
#if __IPHONE_OS_VERSION_MAX_ALLOWED <= __IPHONE_5_1
#define UIInterfaceOrientationMaskPortrait  (1 << UIInterfaceOrientationPortrait)
#define UIInterfaceOrientationMaskLandscapeLeft  (1 << UIInterfaceOrientationLandscapeLeft)
#define UIInterfaceOrientationMaskLandscapeRight (1 << UIInterfaceOrientationLandscapeRight)
#define UIInterfaceOrientationMaskPortraitUpsideDown  (1 << UIInterfaceOrientationPortraitUpsideDown)
#define UIInterfaceOrientationMaskLandscape  (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight)
#define UIInterfaceOrientationMaskAll  (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown)
#define UIInterfaceOrientationMaskAllButUpsideDown (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight)
#endif



//单例宏定义
#undef	SINGLETON_FOR_HEADER
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;


//#if (!__has_feature(objc_arc)) \
//todo:把【aa new】也放到里面
#undef	SINGLETON_FOR_CLASS
#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}



    

#endif

