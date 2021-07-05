#import "AppDelegate.h"
#import "LSViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor whiteColor];
    
    LSViewController *rootVC = [[LSViewController alloc] initWithNibName:@"LaunchScreenViewController" bundle:nil];
    [window setRootViewController:rootVC];

    self.window = window;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
