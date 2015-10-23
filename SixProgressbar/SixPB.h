//
//  SixPB.h
//  SixProgressbar
//
//  Created by edutech on 15/10/22.
//  Copyright © 2015年 luojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SixPB : UIView

@property(nonatomic,assign) float range;
@property(nonatomic,strong) UIColor *lineColor;
@property(nonatomic,strong) UIColor *inColor;
@property(nonatomic,assign) float width_out;
@property(nonatomic,assign) float width_in;

-(id) initSixPB:(CGRect) rect Range:(float) pb;
@end
