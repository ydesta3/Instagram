//
//  HomeFeedViewController.h
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import <UIKit/UIKit.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;

@end

NS_ASSUME_NONNULL_END
