//
//  JccPickerDateView.m
//  JccPickerDateView
//
//  Created by _____Half__ on 15/11/10.
//  Copyright © 2015年 iginwa. All rights reserved.
//

#import "JccPickerDateView.h"

#define ToolbarHeight 44
#define BgViewHeight 260
#define DatePickerHeight 216
#define DefalutColor [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0]

@interface JccPickerDateView()
@property (nonatomic, strong)  UIDatePicker *datePicker;
@property (nonatomic, strong)  UIView *bgView;
@property (nonatomic, strong)  UIToolbar *toolbar;
@end

@implementation JccPickerDateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildLayout];
    }
    return self;
}

/**
 *  视图初始化
 */
-(void)buildLayout{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0] colorWithAlphaComponent:0.5];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelButtonPressed:)];
    [self addGestureRecognizer:tapGesture];
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, BgViewHeight)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    _toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, ToolbarHeight)];
    _toolbar.barStyle = UIBarStyleDefault;
    _toolbar.tintColor = DefalutColor;
    [_bgView addSubview:_toolbar];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelButtonPressed:)];
    [barItems addObject:cancelBtn];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    [barItems addObject:doneBtn];
    
    [_toolbar setItems:barItems];
    
    
    
    _datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, self.frame.size.width, DatePickerHeight)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"];
    [_bgView addSubview:_datePicker];
    
    
    
}

-(void)showView:(PickDateViewBlock)block{
    
    if (block) {
        self.block = block;
    }
    UIWindow *appWindow=[[UIApplication sharedApplication] keyWindow];
    [appWindow addSubview:self];
    [self animateIn];
    
}


-(void)animateIn
{
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.frame=CGRectMake(0, self.frame.size.height-260, self.frame.size.width,260);
    }];
}
-(void)animateOut
{
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.frame=CGRectMake(0, self.frame.size.height, self.frame.size.width,260);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)doneButtonPressed:(id)sender
{
    NSDate *date=[_datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateAndTime =  [dateFormatter stringFromDate:date];
    
    self.block(dateAndTime);
    
    [self animateOut];
}
- (void)cancelButtonPressed:(id)sender
{
    [self animateOut];
}


@end
