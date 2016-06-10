//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISShoppingCart.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    

    FISItem *itemFile = [[FISItem alloc] init];
 
    FISShoppingCart *shoppingCart = [[FISShoppingCart alloc] init];
    

    return YES;
}

@end
