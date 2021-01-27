# ♦︎ ♧ ♥︎ ♤ BLACKJACK ♤ ♥︎ ♧ ♦︎
[![Build Status](https://travis-ci.com/AJ8GH/blackjack.svg?branch=master)](https://travis-ci.com/AJ8GH/blackjack) [![Coverage Status](https://coveralls.io/repos/github/AJ8GH/blackjack/badge.svg?branch=master)](https://coveralls.io/github/AJ8GH/blackjack?branch=master) [![Maintainability](https://api.codeclimate.com/v1/badges/b5ee28ef64bf8bbcf291/maintainability)](https://codeclimate.com/github/AJ8GH/blackjack/maintainability)

## Getting Started

![vegas](https://media.giphy.com/media/ShZ1AHZ1AKyt2/giphy.gif)

Clone:
- `git clone git@github.com:AJ8GH/blackjack.git`

Head to root folder:
- `cd blackjack`

Run play_blackjack.rb:
- `ruby ./lib/play_blackjack.rb`

Enjoy the game! Can you beat the dealer?

## Design

![blackjack](https://www.pinnacle.com/Cms_Data/Contents/Guest/Media/betting-articles/casino/Blackjack/article-how-to-play-blackjack-hero.jpg)

The Blackjack app is designed to model the behaviour of a real life game

##### Deck:
- Just like a real deck of cards - Made up of 52 individual Card Structs, each with a value and a suit attribute
- Self builds and shuffles on initialization
- The game currently runs with one 52 card deck, and can be easily adjusted to use any number of decks

##### Dealer:
- A dealer is initialized when a new game is started and in turn the dealer initializes a new deck.
- Deals cards one at a time which the game assigns to correct player's hand
- Once a card is dealt it is removed from the Deck, so the cards left in the deck accurately reflect the cards which have not yet been seen.
- Once the deck runs out, the dealer rebuilds the deck and the game announces that a new deck is being used

##### Player and Dealer each have:
- A hand attribute which holds their cards and resets after each hand
- The ability to calculate their score
- A score attribute which stores the score after calculation


## Play

![southpark](https://media.giphy.com/media/26ufcZICbgCSGe5sQ/giphy.gif)

###### Player:
- The initial deal puts 2 cards in each hand
- The players cards are both visible, the dealer shows their first card and hides their second
- Unless the player has a blackjack (an ace and a ten card from the initial deal), they can decide to hit or stand
- If they bust, the hand is over. If they stand, play turns to the dealer
- If they have a blackjack play automatically transfers to the dealer
- If they reach 21 after hitting, the game will assume they stand and play automatically transfers to the dealer

###### Dealer:
- Once play transfers to the dealer they reveal their hand
- Unless the player has a blackjack, they will always hit if their score is less than 17 and will always stand with a score of 17 or more, as per official casino blackjack rules

###### Win, lose, push:
- If the player has a blackjack and the dealer does not, the player wins
- If both player and dealer stand, the highest scoring hand wins, with a push declared if the hands are tied
- If the player stands and the dealer busts, the player wins
- If the player busts, the house wins

##### Scoring:
- Scoring is identical to standard blackjack rules
- each card is mapped to its corresponding points value in a hash, with 2 through 10 worth their numeric value, face cards worth ten, and aces worth 11 or 1 depending on the hand.
- Scoring is calculated after the initial deal and after each 'hit'
- Aces are worth 11 by default. If a player would be bust with any aces in their hand, the scoring system automatically adjusts them to 1. Each time scores are calculated it will adjust the minimum number of aces needed, for the player not to be bust. If the player is still bust after all aces are adjusted, they are declared bust and lose the hand.

## How to use this app

- For fun - enjoy a real game of blackjack through your terminal
- For profit - practice counting cards and head to Vegas (no liability accepted for any losses incurred)

## Testing

Tests are written using rspec. Run from root folder with:

`rspec` or `rspec -fd`

## Technical info

Blackjack was built using the following tools and methodologies:
- Ruby
- RSpec
- OOP
- TDD

## [rules & history](https://bicyclecards.com/how-to-play/blackjack/)
