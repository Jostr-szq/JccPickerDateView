//
//  JccPickerDateView.h
//  JccPickerDateView
//
//  Created by _____Half__ on 15/11/10.
//  Copyright © 2015年 iginwa. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^PickDateViewBlock)(NSString *dateTime);

@interface JccPickerDateView : UIView

@property (nonatomic, copy) PickDateViewBlock block;


-(void)showView:(PickDateViewBlock)block;



@end
