//
//  LoginViewController.m
//  Instagram
//
//  Created by Yonatan Desta on 6/27/22.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "SceneDelegate.h"
//#import "TabBarViewController.h"




@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)onSignupTap:(id)sender {
    // initialize a user object
       PFUser *newUser = [PFUser user];
       
       // set user properties
       newUser.username = self.usernameField.text;
       //newUser.email = self.emailField.text;
       newUser.password = self.passwordField.text;
       
       // call sign up function on the object
       [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
           if (error != nil) {
               NSLog(@"Error: %@", error.localizedDescription);
           } else {
               NSLog(@"User registered successfully");
               // manually segue to logged in view
               //[self performSegueWithIdentifier:@"signUpSegue" sender:nil];
               SceneDelegate *sceneDelegate = (SceneDelegate *)UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
               UITabBarController *tabbViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabViewController"];
               sceneDelegate.window.rootViewController = tabbViewController;
           }
       }];
    
}

- (IBAction)onLoginTap:(id)sender {
    
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            // display view controller that needs to shown after successful login
            //[self performSegueWithIdentifier:@"loginSegue" sender:nil];
            SceneDelegate *sceneDelegate = (SceneDelegate *)UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UITabBarController *tabbViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabViewController"];
            sceneDelegate.window.rootViewController = tabbViewController;
        }
    }];
}


@end
