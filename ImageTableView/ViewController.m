
#import "ViewController.h"
#import "ImageCell.h"

#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Iden:ImageTableView
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goNext:(UIButton *)sender {
    NSString *str = self.myTextField.text;
    if ([str isEqualToString:@"654321"]) {
        ImageViewController *imageVC = [[ImageViewController alloc]init];
        [self presentViewController:imageVC animated:YES completion:Nil];
        self.myTextField.text = @"";
    }
}
@end
