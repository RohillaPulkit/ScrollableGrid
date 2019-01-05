//
//  GridCell.h
//  ScrollableGrid
//
//  Created by Pulkit Rohilla on 19/06/15.
//  Copyright (c) 2015 PulkitRohilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridCell : UIView

-(id)initGridCellWithStrings:(NSArray *)strings andWidth:(CGFloat)width andHeight:(CGFloat)height andY:(CGFloat)y;

@end
