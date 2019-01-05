//
//  ViewController.m
//  ScrollableGrid
//
//  Created by Pulkit Rohilla on 19/06/15.
//  Copyright (c) 2015 PulkitRohilla. All rights reserved.
//

#import "ViewController.h"
#import "GridCell.h"

@implementation ViewController{
    
    NSArray *titles;
    NSArray *values, *values2;
    
    CGFloat headerWidth;
    CGFloat cellHeight;
    CGFloat totalWidth;
    
    CGFloat y;
}
@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    titles = [[NSArray alloc] initWithObjects:@"Title 1",@"Title 2",@"Title 3",@"Title 4",@"Title 5",@"Title 6",@"Title 7",@"Title 8", nil];
    
    values = [[NSArray alloc] initWithObjects:@"Value 1",@"Value 2",@"Value 3",@"Value 4",@"Value 5",@"Value 6",@"Value 7",@"Value 8", nil];
    
    values2 = [[NSArray alloc] initWithObjects:@"Value 1",@"Value 2",@"Value 3",@"Value 4",@"Value 5",@"Value 6",@"Value 7",@"Value 8", nil];

    [self addViewsOnScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addViewsOnScrollView{
    
    y = 0;

    for (int index = 0; index < 3; index++) {
        
        if (index == 0) {
            
            [self setHeaderWidth];
        
            [scrollView addSubview:[[GridCell alloc] initGridCellWithStrings:titles andWidth:headerWidth andHeight:[self getCellHeight:titles] andY:y]];
            
            y = y + [self getCellHeight:titles];
        }
        else if(index == 1)
        {
            [scrollView addSubview:[[GridCell alloc] initGridCellWithStrings:values andWidth:headerWidth andHeight:[self getCellHeight:values] andY:y]];
            
            y = y + [self getCellHeight:values];
        }
        else
        {
            [scrollView addSubview:[[GridCell alloc] initGridCellWithStrings:values2 andWidth:headerWidth andHeight:[self getCellHeight:values2] andY:y]];
            
            y = y + [self getCellHeight:values2];
        }
        
    }
    
    [scrollView setContentSize:CGSizeMake(headerWidth*titles.count, 0)];
}


#pragma mark - Other Methods

-(void)setHeaderWidth{
    
    NSString *longestWord = nil;
    
    for(NSString *str in titles) {
        
        if ([str length] > [longestWord length]) {
            
            longestWord = str;
        }
    }
    
    NSLog(@"Longest Header : %@", longestWord);
    
    CGSize stringSize = [longestWord sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    CGFloat width = stringSize.width;
    
    headerWidth = width+60;
}

-(CGFloat)getCellHeight:(NSArray *)strings{
    
    NSString *longestWord = nil;
    
    for(NSString *str in strings) {
        
        if ([str length] > [longestWord length]) {
            
            longestWord = str;
        }
    }
    
    UIFont *cellFont = [UIFont systemFontOfSize:15];
    
    CGSize constraintSize = CGSizeMake(headerWidth, MAXFLOAT);
    
    CGRect labelRect = [longestWord
                        boundingRectWithSize:constraintSize
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{ NSFontAttributeName : cellFont}
                        context:nil];
    
    
    return labelRect.size.height+20;
    
}

@end
