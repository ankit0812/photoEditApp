//
//  ViewController.m
//  photoEditApp
//
//  Created by optimusmac4 on 7/29/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
UIView *newView;
}


-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;

-(void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer;

-(void)handleRotationWithGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer;

-(void)moveViewWithGestureRecognizer1:(UIPanGestureRecognizer *)panGestureRecognizer1;

-(void)handlePinchWithGestureRecognizer1:(UIPinchGestureRecognizer *)pinchGestureRecognizer1;

-(void)handleRotationWithGestureRecognizer1:(UIRotationGestureRecognizer *)rotationGestureRecognizer1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.smallImageView addGestureRecognizer:panGestureRecognizer];
    
  
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer:)];
    [self.smallImageView addGestureRecognizer:pinchGestureRecognizer];
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationWithGestureRecognizer:)];
    [self.smallImageView addGestureRecognizer:rotationGestureRecognizer];
    
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePic:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil                                                                                                                                                                                                 cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (IBAction)savePic:(id)sender {
    
    UIGraphicsBeginImageContext(_bigImageView.frame.size);
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
    
    
}

- (IBAction)openGallery:(id)sender
    {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
    }

//Choose Images from gallery

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

// Cancel choosing images

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

    
    


-(IBAction)addText:(id)sender
{
    UITextField *tf= [[UITextField alloc] initWithFrame:CGRectMake(10, 30, 200, 40)];
    newView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 200, 40)];
   
    tf.text=@"Enter Your Text here";
    [newView addSubview:tf];
    
    [_bigImageView addSubview:newView];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer1:)];
    [newView addGestureRecognizer:panGestureRecognizer];
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer1:)];
    [newView addGestureRecognizer:pinchGestureRecognizer];
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationWithGestureRecognizer1:)];
    [newView addGestureRecognizer:rotationGestureRecognizer];
}


# pragma mark - These methods are used for Gesture recognition


//Moving the image or text
-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    self.smallImageView.center = touchLocation;
    
}

-(void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    self.smallImageView.transform = CGAffineTransformScale(self.smallImageView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    
    pinchGestureRecognizer.scale = 1.0;
}

-(void)handleRotationWithGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    self.smallImageView.transform = CGAffineTransformRotate(self.smallImageView.transform, rotationGestureRecognizer.rotation);
    
    rotationGestureRecognizer.rotation = 0.0;
}




-(void)moveViewWithGestureRecognizer1:(UIPanGestureRecognizer *)panGestureRecognizer1
{
    
    CGPoint touchLocation = [panGestureRecognizer1 locationInView:self.view];
    newView.center = touchLocation;
    
}

-(void)handlePinchWithGestureRecognizer1:(UIPinchGestureRecognizer *)pinchGestureRecognizer1
{
 newView.transform = CGAffineTransformScale(newView.transform, pinchGestureRecognizer1.scale, pinchGestureRecognizer1.scale);
    
    pinchGestureRecognizer1.scale = 1.0;
}

-(void)handleRotationWithGestureRecognizer1:(UIRotationGestureRecognizer *)rotationGestureRecognizer1
{
    newView.transform = CGAffineTransformRotate(newView.transform, rotationGestureRecognizer1.rotation);
    
    rotationGestureRecognizer1.rotation = 0.0;
}

@end
