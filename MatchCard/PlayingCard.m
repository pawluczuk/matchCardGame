//
//  PlayingCard.m
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "PlayingCard.h"
static const int SUITS_MATCH_BONUS = 1;
static const int RANKS_MATCH_BONUS = 4;

@implementation PlayingCard
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards
{
	int score = 0;
	
	if ([otherCards count] == 1)
	{
		PlayingCard *otherCard = [otherCards firstObject];
		if ([self.suit isEqualToString:otherCard.suit])
		{
			// suits match
			score += SUITS_MATCH_BONUS;
		}
		// else - we never have the same cards
		else if ( self.rank == otherCard.rank )
		{
			// ranks match
			score += RANKS_MATCH_BONUS;
		}
	}
	
	return score;
}

// public class method, return array with allowed suits
+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♣", @"♠"];
}

//public class mehod, return maximum rank
+ (NSUInteger) maxRank
{
    return [[self rankStrings] count] - 1;
}

// class method, puts mask on int rank value
+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [ rankStrings[self.rank] stringByAppendingString:self.suit];
}

// setter for suit
- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit ])
    {
        _suit = suit;
    }
}

// getter for suit
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

// setter for rank
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}
@end
