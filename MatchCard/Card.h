//
//  Card.h
//  cards
//
//  Created by Monika Pawluczuk on 19/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
// sign of the card
@property (strong, nonatomic) NSString *contents;
// is this card chosen?
@property (nonatomic, getter = isChosen) BOOL chosen;
// is this card matching?
@property (nonatomic, getter = isMatched) BOOL matched;

// are cards matching - 0 if do not mach, else score
- (int)match:(NSArray *)otherCards;
@end
