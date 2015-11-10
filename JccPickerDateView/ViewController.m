//
//  ViewController.m
//  JccPickerDateView
//
//  Created by _____Half__ on 15/11/10.
//  Copyright © 2015年 iginwa. All rights reserved.
//

#import "ViewController.h"
#import "JccPickerDateView.h"

@interface ViewController ()

@property (nonatomic, strong)  JccPickerDateView *pickerView;

@end

@implementation ViewController

-(JccPickerDateView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[JccPickerDateView alloc]init];
    }
    return _pickerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showButtonPress:(id)sender {
    [self.pickerView showView:^(NSString *dateTime) {
        NSLog(@"选取时间：%@",dateTime);
    }];
}
@end
