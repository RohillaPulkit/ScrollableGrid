//
//  GridCell.m
//  ScrollableGrid
//
//  Created by Pulkit Rohilla on 19/06/15.
//  Copyright (c) 2015 PulkitRohilla. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell

-(id)initGridCellWithStrings:(NSArray *)strings andWidth:(CGFloat)width andHeight:(CGFloat)height andY:(CGFloat)y{
    
    self = [super init];
    
    if (self) {
        // Initialization code
        CGFloat x = 0;
        UIView *view;
        
        for (NSString *str in strings) {
            
            view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
            CALayer *bottomBorder = [CALayer layer];
            bottomBorder.frame = CGRectMake(0, height, view.bounds.size.width, 1.0f);
            bottomBorder.backgroundColor = [UIColor colorWithWhite:0.8f
                                                             alpha:1.0f].CGColor;
            [view.layer addSublayer:bottomBorder];
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:view.bounds];
            [lbl setFont:[UIFont systemFontOfSize:15]];
            [lbl setText:str];
            [lbl setTextAlignment:NSTextAlignmentCenter];
            [lbl setNumberOfLines:0];
            [lbl setLineBreakMode:NSLineBreakByWordWrapping];
            
            [view addSubview:lbl];
            
            [self addSubview:view];
            x = x + width;
            
            NSLog(@"%@",str);
        }
        
    }
    
    [self setBackgroundColor:[UIColor blackColor]];

    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
