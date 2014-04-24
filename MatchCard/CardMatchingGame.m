//
//  CardMatchingGame.m
//  MatchCard
//
//  Created by Monika Pawluczuk on 20/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "CardMatchingGame.h"
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

@interface CardMatchingGame()
// readwrite: there will be a setter - private for this class only
@property (nonatomic, readwrite) NSInteger score;
// array of cards we're using
@property (nonatomic, strong) NSMutableArray *cards;
// status of game
@property (nonatomic, readwrite) BOOL endOfGame;
// matches till the end of game left
@property (nonatomic, readwrite) NSInteger matchesLeft;

@end
@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }
            else // we're run out of cards
            {
                self = nil;
                break;
            }
            
        }
    }
	_endOfGame = NO;
    return self;
}


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched)
    {
        // toggling the card
        if (card.isChosen)
        {
            card.chosen = NO;
        }
        else
        {
            // match card against another card
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
        
    }
	
	// check whether it's not the end of game
	[self gameIsOver];
}

- (void)gameIsOver
{
	_matchesLeft = 0;
	// match each card against another card
	for (Card *card in self.cards)
	{
		if (!card.isMatched)
		{
			for (Card *otherCard in self.cards)
			{
				if (card != otherCard && !otherCard.isMatched)
				{
					int matchScore = [card match:@[otherCard]];
					if (matchScore)
					{
						_matchesLeft++;
					}
				}
				
			}
		}

	}
	if (_matchesLeft == 0)
	{
		self.endOfGame = YES;
	}
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}
@end
