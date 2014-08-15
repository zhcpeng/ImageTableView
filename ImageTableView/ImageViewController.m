//
//  ImageViewController.m
//  ImageTableView
//
//  Created by SKYA03  on 14-4-4.
//  Copyright (c) 2014年 SKYA03 . All rights reserved.
//



@interface UIScrollView(UIScrollViewInternal)

-(void)_setContentOffsetAnimationDuration:(NSTimeInterval)duration;

@end


#import "ImageViewController.h"
#import "ImageCell.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

@synthesize fileManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageList = [[NSMutableArray alloc]init];
    
    self.fileManager = [NSFileManager defaultManager];
    self.imagePathArray = [[NSMutableArray alloc]init];
    
    
    
    self.imageTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DeviceHeight, DeviceWidth)];
    self.imageTableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.imageTableView.delegate = self;
    self.imageTableView.dataSource = self;
    self.imageTableView.center = CGPointMake(DeviceWidth *0.5, DeviceHeight * 0.5);
    self.imageTableView.pagingEnabled = YES;
    [self.view addSubview:self.imageTableView];
    
    
    NSError *error;
    if ([fileManager fileExistsAtPath:[self documentPath]]) {
        NSArray *contList = [fileManager contentsOfDirectoryAtPath:[self documentPath] error:&error];
//        NSLog(@"%@",contList);
        
        if (contList != nil) {
            for (int i = 0; i < contList.count; i++) {
                NSString *string = [contList objectAtIndex:i];
                NSRange range1 = [string rangeOfString:@"png"];
                NSRange range2 = [string rangeOfString:@"jpg"];
                NSRange range3 = [string rangeOfString:@"PNG"];
                NSRange range4 = [string rangeOfString:@"JPG"];
                //                NSRange range5 = [string rangeOfString:@"jpeg"];
                //                NSRange range6 = [string rangeOfString:@"JPEG"];
                
                if (range1.length|range2.length|range3.length|range4.length) {
                    NSString *imagePath = [[self documentPath] stringByAppendingString:[NSString stringWithFormat:@"/%@",[contList objectAtIndex:i]]];
                    [self.imagePathArray addObject:[contList objectAtIndex:i]];
                    UIImage *mjPhoto = [UIImage imageWithContentsOfFile:imagePath];
                    [self.imageList addObject:mjPhoto];
                }
            }
        }
    }
    [self.imageTableView _setContentOffsetAnimationDuration:1.0];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 20, 50, 30);
    button.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
    [button setTitle:@"<" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return DeviceWidth;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    if (!cell) {
        cell = [[ImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    UIImage *image = [self.imageList objectAtIndex:indexPath.row];
    cell.imgView.image = image;
    //缩放图片到原大小
//    if (image.size.width < DeviceWidth - 40) {
//        CGRect frame = cell.imgView.frame;
//        frame.size.width = image.size.width;
//        cell.imgView.frame = frame;
//    }
    cell.imgView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imgView.center = cell.contentView.center;
    cell.imageName.text = [self.imagePathArray objectAtIndex:indexPath.row];
    cell.page.text = [NSString stringWithFormat:@"%d/%d",indexPath.row+1,self.imageList.count];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
-(void)goBackAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(NSString *)documentPath{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = [paths objectAtIndex:0];
    return documentPath;
}
-(void)scrollTimer{
    CGRect bounds = _imageTableView.bounds;
    float y = CGRectGetMinY(bounds);
    int row = (int)y / DeviceWidth + 1;
    if (row == _imageList.count) {
        [_imageTableView scrollRectToVisible:CGRectMake(0, 0, DeviceHeight, DeviceWidth) animated:NO];
        return;
    }
    [_imageTableView scrollRectToVisible:CGRectMake(0, row *DeviceWidth, DeviceHeight, DeviceWidth) animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
