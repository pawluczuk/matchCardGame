//
//  PlayingCard.h
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
// hearts, diamonds etc
@property (strong, nonatomic) NSString *suit;
// three, four, jack, king etc (0-13)
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger) maxRank;
@end
