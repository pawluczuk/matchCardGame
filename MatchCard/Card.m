//
//  Card.m
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "Card.h"

@implementation Card
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        // gives one point if card matches any other card in the game
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}
@end
