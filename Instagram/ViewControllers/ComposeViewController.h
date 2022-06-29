//
//  ComposeViewController.h
//  Instagram
//
//  Created by Yonatan Desta on 6/29/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

@end

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>



@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imageSelected;
@property (weak, nonatomic) IBOutlet UITextField *postCaptionTextField;

@end

NS_ASSUME_NONNULL_END
