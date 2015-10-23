//
//  SixPB.m
//  SixProgressbar
//
//  Created by edutech on 15/10/22.
//  Copyright © 2015年 luojie. All rights reserved.
//

#import "SixPB.h"
#import <math.h>
@implementation SixPB

-(id)initSixPB:(CGRect)rect Range:(float)pb
{
    self = [super initWithFrame:rect];
    if(self)
    {
        self.range = pb;
        self.lineColor = [UIColor colorWithRed:189.0/255.0 green:189.0/255.0 blue:190.0/255.0 alpha:1.0];
        self.inColor = [UIColor colorWithRed:70/255.0 green:170/255.0 blue:170/255.0 alpha:1.0];
        self.backgroundColor = [UIColor clearColor];
        self.width_in = rect.size.width>rect.size.height?(rect.size.width-12)/2:(rect.size.height-12)/2;
        self.width_out = rect.size.width>rect.size.height?(rect.size.width-6)/2:(rect.size.height-6)/2;
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    float width = self.width_out;
    CGPoint point = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    float x = point.x;
    float y = point.y;
    float w1 = 1.0/2*width;
    float w2 = powf(3, 0.5)*w1;
    NSLog(@"%f,%f,%f,%f",x,y,w1,w2);
    CGPoint p1 = CGPointMake(x-w1, y-w2);
    CGPoint p2 = CGPointMake(x-width, y);
    CGPoint p3 = CGPointMake(x-w1, y+w2);
    CGPoint p4 = CGPointMake(x+w1, y+w2);
    CGPoint p5 = CGPointMake(x+width, y);
    CGPoint p6 = CGPointMake(x+w1, y-w2);
    CGContextSetStrokeColorWithColor(context, [self.lineColor CGColor]);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    CGContextAddLineToPoint(context, p3.x, p3.y);
    CGContextAddLineToPoint(context, p4.x, p4.y);
    CGContextAddLineToPoint(context, p5.x, p5.y);
    CGContextAddLineToPoint(context, p6.x, p6.y);
    CGContextAddLineToPoint(context, p1.x, p1.y);
    CGContextStrokePath(context);
    
    float width2 = self.width_in;
    float w11 = 1.0/2*self.width_in;
    float w12 = powf(3, 0.5)*w11;
    NSLog(@"%f,%f,%f,%f",x,y,w11,w12);
    CGPoint p11 = CGPointMake(x-w11, y-w12);
    CGPoint p12 = CGPointMake(x-self.width_in, y);
    CGPoint p13 = CGPointMake(x-w11, y+w12);
    CGPoint p14 = CGPointMake(x+w11, y+w12);
    CGPoint p15 = CGPointMake(x+self.width_in, y);
    CGPoint p16 = CGPointMake(x+w11, y-w12);
    float x1,y1,x2,y2;
    if(self.range>0.5)
    {
        x1 = x-w11-w11*(1.0-self.range)*2;
        y1 = y-w12+w12*(1.0-self.range)*2;
        x2 = x+w11+w11*(1.0-self.range)*2;
        y2 = y1;
    }else if(self.range==0.5)
    {
        x1 = x;
        y1 = y;
        x2 = x;
        y2 = y1;
    }else if(self.range<0.5)
    {
        x1 = x-w11-w11*(self.range)*2;
        y1 = y+w12-w12*(self.range)*2;
        x2 = x+w11+w11*(self.range)*2;
        y2 = y1;
    }
    NSLog(@"....%f,%f,%f,%f",x1,y1,x2,y2);
    CGContextSetFillColorWithColor(context, [self.inColor CGColor]);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    if(self.range>=1.0)
    {
        CGContextMoveToPoint(context, p11.x, p11.y);
        CGContextAddLineToPoint(context, p12.x, p12.y);
        CGContextAddLineToPoint(context, p13.x, p13.y);
        CGContextAddLineToPoint(context, p14.x, p14.y);
        CGContextAddLineToPoint(context, p15.x, p15.y);
        CGContextAddLineToPoint(context, p16.x, p16.y);
        CGContextAddLineToPoint(context, p11.x, p11.y);
        CGContextDrawPath(context,kCGPathFill);
    }else if(self.range>0.5&&self.range<1.0)
    {
        CGContextMoveToPoint(context, x1, y1);
        CGContextAddLineToPoint(context, p12.x, p12.y);
        CGContextAddLineToPoint(context, p13.x, p13.y);
        CGContextAddLineToPoint(context, p14.x, p14.y);
        CGContextAddLineToPoint(context, p15.x, p15.y);
        CGContextAddLineToPoint(context, x2, y2);
        CGContextAddLineToPoint(context, x1, y1);
        CGContextDrawPath(context,kCGPathFill);
    }else if(self.range<0.5)
    {
        CGContextMoveToPoint(context, x1, y1);
        CGContextAddLineToPoint(context, p13.x, p13.y);
        CGContextAddLineToPoint(context, p14.x, p14.y);
        CGContextAddLineToPoint(context, x2, y2);
        CGContextAddLineToPoint(context, x1, y1);
        CGContextDrawPath(context,kCGPathFill);
    }else if(self.range==0.5)
    {
        CGContextMoveToPoint(context, p12.x, p12.y);
        CGContextAddLineToPoint(context, p13.x, p13.y);
        CGContextAddLineToPoint(context, p14.x, p14.y);
        CGContextAddLineToPoint(context, p15.x, p15.y);
        CGContextAddLineToPoint(context, p12.x, p12.y);
        CGContextDrawPath(context,kCGPathFill);
    }
}
@end
