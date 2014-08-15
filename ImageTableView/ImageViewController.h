//
//  ImageViewController.h
//  ImageTableView
//
//  Created by SKYA03  on 14-4-4.
//  Copyright (c) 2014年 SKYA03 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *imageTableView;
@property (strong, nonatomic) NSMutableArray *imageList;

@property (strong, nonatomic) NSFileManager *fileManager;
@property (strong, nonatomic) NSMutableArray *imagePathArray;

@end
