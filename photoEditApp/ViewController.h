//
//  ViewController.h
//  photoEditApp
//
//  Created by optimusmac4 on 7/29/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)takePic:(id)sender;
- (IBAction)savePic:(id)sender;
- (IBAction)openGallery:(id)sender;
- (IBAction)addText:(
                     id)sender;
@property (weak, nonatomic) IBOutlet UIView *bigImageView;

@property (weak, nonatomic) IBOutlet UIView *smallImageView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

