//
//  DetailsViewController.m
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import "DetailsViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "DateTools.h"
#import "UIImageview+AFNetworking.h"



@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.username.text = self.post.author.username;
    [self.imagePosted setImageWithURL:[NSURL URLWithString:self.post.image.url]];
    self.postCaption.text = self.post.caption;
    self.dateCreated.text = [self.post.createdAt shortTimeAgoSinceNow];
    
    self.userProfilePhoto.layer.cornerRadius = (self.userProfilePhoto.frame.size.height)/2;
    self.userProfilePhoto.clipsToBounds = true;
        
}

@end
