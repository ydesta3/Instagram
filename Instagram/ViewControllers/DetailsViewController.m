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
        
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
