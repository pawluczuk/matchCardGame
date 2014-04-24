//
//  CardMatchingGame.h
//  MatchCard
//
//  Created by Monika Pawluczuk on 20/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// without public setter - only model can set score
@property (nonatomic, readonly) NSInteger score;

// status of game
@property (nonatomic, readonly) BOOL endOfGame;

//how many cards we will be playing with
// designated initalizer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

// specify which card did the user choose
- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
