//
//  Deck.h
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
@end
