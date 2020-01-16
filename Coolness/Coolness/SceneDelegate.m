#import "SceneDelegate.h"
#import "CLNCoolController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.backgroundColor = UIColor.systemYellowColor;
    self.window.rootViewController = [[CLNCoolController alloc] init];
    [self.window makeKeyAndVisible];
}

@end
