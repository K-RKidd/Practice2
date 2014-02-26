//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Krystle on 2/17/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView


-(void)setRank:(NSUInteger)rank {
    _rank = rank;
    [self setNeedsDisplay];
}

-(void) setSuit:(NSString *)suit{
    _suit = suit;
    [self setNeedsDisplay];
    
}
-(void) setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
    [self setNeedsDisplay];
    
}

#define CORNER_FONT_STANDARD_HEIGHT 180.0;
#define CORNER_RADIUS 12.0;

 -(CGFloat ) cornerScaleFactor
{
    CGFloat height = self.bounds.size.height;
    CGFloat new = height / CORNER_FONT_STANDARD_HEIGHT;
    return new;
}

-(CGFloat) cornerRadius
{
    CGFloat radius = [self cornerScaleFactor] * CORNER_RADIUS;
    return radius;
}
-(CGFloat) cornerOffset
{
    CGFloat offset = [self cornerRadius] /3.0;
    return offset;
}
-(void) drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill (self.bounds);
    [[UIColor blackColor]setStroke];
    [roundedRect stroke];
    [self drawCorners];

}
-(void) setUp
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
    
}
-(void) awakeFromNib
{
    [self setUp];
}
-(void)drawCorners

{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont *cornerFont = [UIFont preferredFontForTextStyle: UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    NSString *cornerString = [NSString stringWithFormat:@ "@%@\n%@", [self rankAsString:self.rank ], self.suit];
    NSAttributedString *cornterText = [[NSAttributedString alloc] initWithString:cornerString attributes:@ {NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornterText size];
    [cornterText drawInRect:textBounds];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(ctx, 180);
    [cornterText drawInRect:textBounds];
}

-(NSString *)rankAsString: (NSUInteger)rank {
NSArray *string = @ [@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", @"10", @"J", @"Q", @"K"];
    return  [string objectAtIndex:rank];
}
@end
