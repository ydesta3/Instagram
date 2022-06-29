//
//  DetailsViewController.h
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"


NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePhoto;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosted;
@property (weak, nonatomic) IBOutlet UILabel *dateCreated;
@property (weak, nonatomic) IBOutlet UITextView *postCaption;
@property (strong, nonatomic) Post *post;


@end

NS_ASSUME_NONNULL_END
