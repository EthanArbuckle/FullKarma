#import <UIKit/UIKit.h>

@interface RedditAPI : NSObject {
    int karmaLink;
	int karmaComment;
    NSString* authenticatedUser;
}
@property(assign) int karmaComment;
@property(assign) int karmaLink;
@property(retain) NSString* authenticatedUser;
@end

@interface AlienBlueAppDelegate : NSObject {
    RedditAPI* redditAPI;
}
@property(retain) RedditAPI* redditAPI;
@end

@interface JMOutlineViewController : UIViewController
@end

@interface ABOutlineViewController : JMOutlineViewController
@end

@interface RedditsViewController : ABOutlineViewController
-(id)titleForUserProfileSection;
@end

%hook RedditsViewController

-(id)titleForUserProfileSection {
    RedditAPI *adAPI = [(AlienBlueAppDelegate *)[[UIApplication sharedApplication] delegate] redditAPI];
    int ckarma = [adAPI karmaComment];
    int lkarma = [adAPI karmaLink];
    NSString *user = [adAPI authenticatedUser];
    return [NSString stringWithFormat:@"%@ (%d : %d)", user, lkarma, ckarma];
}

%end