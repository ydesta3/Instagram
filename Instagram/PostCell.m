//
//  PostCell.m
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import "PostCell.h"
#import "Parse/Parse.h"
#import "UIImageview+AFNetworking.h"
#import "DateTools.h"




@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.profileImage.layer.cornerRadius = (self.profileImage.frame.size.height)/2;
    self.profileImage.clipsToBounds = true;
}


- (void)setPost:(Post *)post {
    _post = post;
    [self.postedImage setImageWithURL:[NSURL URLWithString:self.post.image.url]];
    self.authorUsername.text = post.author.username;
    self.postCaption.text = post.caption;
    self.postTimeStamp.text = [post.createdAt shortTimeAgoSinceNow];

}

@end
