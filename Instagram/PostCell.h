//
//  PostCell.h
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"


@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *authorUsername;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *postTimeStamp;
@property (weak, nonatomic) IBOutlet UIImageView *postedImage;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UITextView *postCaption;
@property (strong, nonatomic) Post *post;


@end

NS_ASSUME_NONNULL_END
