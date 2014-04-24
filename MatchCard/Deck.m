//
//  Deck.m
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "Deck.h"
@interface Deck()
// storage for all cards
@property (strong, nonatomic) NSMutableArray *cards;
@end
@implementation Deck
- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop)
    {
        // adding to the top
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        // adding to the end
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    // if cards array exists
    if ([self.cards count])
    {
        NSUInteger index = arc4random()%[self.cards count];
        NSLog(@"%d",index);
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
