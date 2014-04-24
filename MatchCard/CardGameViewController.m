//
//  CardGameViewController.m
//  MatchCard
//
//  Created by Monika Pawluczuk on 20/04/14.
//  Copyright (c) 2014 Monika Pawluczuk. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
// game model
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *endOfGameLabel;
@property (weak, nonatomic) IBOutlet UIButton *replayButton;


@end

@implementation CardGameViewController
// starts game again
- (IBAction)touchReplayButton:(id)sender
{
	_game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count]
											  usingDeck: [self createDeck]];
	[self updateUI];
}

- (CardMatchingGame *)game
{
    if (!_game)
    {
        _game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count]
                                                  usingDeck: [self createDeck]];
    }
    return _game;
}
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


// turns the card over
- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

// updates cards and score
- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageforCard:card]
                              forState:UIControlStateNormal];
		// if we matched card, we disable it
        cardButton.enabled = !card.isMatched;
    }

	self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
	
	if (self.game.endOfGame)
	{
		self.endOfGameLabel.text = @"End of game";
		for (UIButton *cardButton in self.cardButtons)
		{
			cardButton.enabled = NO;
		}
	}
}

// displays card suit and rank when card is flipped
- (NSString *)titleForCard:(Card *)card
{
	return card.isChosen ? card.contents : @"";
}

// displays the right background for the card
- (UIImage *)backgroundImageforCard:(Card *)card
{
    return [UIImage imageNamed:(card.isChosen ? @"cardfront" : @"cardback")];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
