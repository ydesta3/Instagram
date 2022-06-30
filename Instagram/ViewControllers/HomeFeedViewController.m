//
//  HomeFeedViewController.m
//  Instagram
//
//  Created by Yonatan Desta on 6/28/22.
//

#import "HomeFeedViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"
#import "SceneDelegate.h"
#import "ComposeViewController.h"
#import "PostCell.h"
#import "DetailsViewController.h"


@interface HomeFeedViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *arrayOfPosts;
@property (nonatomic, strong) IBOutlet UIRefreshControl *refresh;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    [self getTimeLine];
    
    self.refresh = [[UIRefreshControl alloc] init];
    [self.refresh addTarget:self action:@selector(getTimeLine) forControlEvents:UIControlEventValueChanged];
    [self.feedTableView addSubview: self.refresh];

}

-(void) getTimeLine{
    
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt" ];
    [query includeKey:@"author"];
    query.limit = 20;


    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.arrayOfPosts = posts;
            [self.feedTableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.refresh endRefreshing];

    }];
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString: @"toCompose"]){
        UINavigationController *navController = [segue destinationViewController];
        ComposeViewController *composeVC =(ComposeViewController*) navController.topViewController;
        composeVC.delegate = self;
    } else if([segue.identifier isEqualToString: @"toDetails"])  {
        DetailsViewController *detailsController = [segue destinationViewController];
        NSIndexPath *index = self.feedTableView.indexPathForSelectedRow;
        Post *dataToPass = self.arrayOfPosts[index.row];
        detailsController.post = dataToPass;
    }

}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *singlePostCell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.arrayOfPosts[indexPath.row];
    singlePostCell.post = post;
//    PFUser *currentUser = post[@"author"];
    singlePostCell.selectionStyle = nil;
    
    return singlePostCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count;
}

- (void)didPost{
    [self getTimeLine];
    [self.feedTableView reloadData];
}


@end
