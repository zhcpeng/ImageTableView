//
//  ViewController.h
//  ImageTableView
//
//  Created by SKYA03  on 14-1-16.
//  Copyright (c) 2014年 SKYA03 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
- (IBAction)goNext:(UIButton *)sender;

@end
