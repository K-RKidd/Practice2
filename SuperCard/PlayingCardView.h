//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Krystle on 2/17/14.
//  Copyright (c) 2014 Krystle Kidd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

-(CGFloat) cornerScaleFactor;
-(CGFloat) cornerRadius;
-(CGFloat) cornerOffset;
- (NSString *)rankAsString:(NSUInteger)rank;

@end
