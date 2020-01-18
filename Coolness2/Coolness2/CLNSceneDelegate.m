#import "CLNSceneDelegate.h"
#import "CLNCoolController.h"

@implementation CLNSceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.backgroundColor = UIColor.systemYellowColor;
    self.window.rootViewController = [[CLNCoolController alloc] initWithNibName:@"CoolStuff" bundle:nil];
    [self.window makeKeyAndVisible];
}

@end
