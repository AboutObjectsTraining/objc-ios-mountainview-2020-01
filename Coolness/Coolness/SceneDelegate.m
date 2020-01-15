#import "SceneDelegate.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.backgroundColor = UIColor.brownColor;
    
    
    [self.window makeKeyAndVisible];
    
    NSLog(@"In %s", __func__);
}

@end
