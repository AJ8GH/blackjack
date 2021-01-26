# ♦︎ ♧ ♥︎ ♤ BLACKJACK ♤ ♥︎ ♧ ♦︎
[![Build Status](https://travis-ci.com/AJ8GH/blackjack.svg?branch=master)](https://travis-ci.com/AJ8GH/blackjack)

![blackjack](https://www.pinnacle.com/Cms_Data/Contents/Guest/Media/betting-articles/casino/Blackjack/article-how-to-play-blackjack-hero.jpg) [![Maintainability](https://api.codeclimate.com/v1/badges/b5ee28ef64bf8bbcf291/maintainability)](https://codeclimate.com/github/AJ8GH/blackjack/maintainability)

## GETTING STARTED

Clone repo:
- `git clone git@github.com:AJ8GH/blackjack.git`

Head to root folder:
- `cd blackjack`

Run example_game.rb:
- `ruby ./lib/example_game.rb`

Enjoy the game! Can you beat the dealer?

Betting capabilities coming soon...

![vegas](https://media.giphy.com/media/ShZ1AHZ1AKyt2/giphy.gif)


## TESTING

Tests are written using rspec. Run from root folder with:

`rspec` or `rspec -fd`

## TECHNICAL INFO

BlackJack was built using the following tools and methodologies:
- Ruby
- RSpec
- OOP
- TDD

## THE RULES

![southpark](https://media.giphy.com/media/26ufcZICbgCSGe5sQ/giphy.gif)

Equally well known as Twenty-One. The rules are simple, the play is thrilling, and there is opportunity for high strategy. In fact, for the expert player who mathematically plays a perfect game and is able to count cards, the odds are sometimes in that player's favour to win.

But even for the casual participant who plays a reasonably good game, the casino odds are less, making Blackjack one of the most attractive casino games for the player. While the popularity of Blackjack dates from World War I, its roots go back to the 1760s in France, where it is called Vingt-et-Un (French for 21). Today, Blackjack is the one card game that can be found in every American gambling casino. As a popular home game, it is played with slightly different rules. In the casino version, the house is the dealer (a "permanent bank"). In casino play, the dealer remains standing, and the players are seated. The dealer is in charge of running all aspects of the game, from shuffling and dealing the cards to handling all bets. In the home game, all of the players have the opportunity to be the dealer (a "changing bank").

#### THE PACK
The standard 52-card pack is used, but in most casinos several decks of cards are shuffled together. The six-deck game (312 cards) is the most popular. In addition, the dealer uses a blank plastic card, which is never dealt, but is placed toward the bottom of the pack to indicate when it will be time for the cards to be reshuffled. When four or more decks are used, they are dealt from a shoe (a box that allows the dealer to remove cards one at a time, face down, without actually holding one or more packs).

#### OBJECT OF THE GAME
Each participant attempts to beat the dealer by getting a count as close to 21 as possible, without going over 21.

#### CARD VALUES/SCORING
It is up to each individual player if an ace is worth 1 or 11. Face cards are 10 and any other card is its pip value.

#### BETTING
Before the deal begins, each player places a bet, in chips, in front of them in the designated area. Minimum and maximum limits are established on the betting, and the general limits are from $2 to $500.

#### THE SHUFFLE AND CUT
The dealer thoroughly shuffles portions of the pack until all the cards have been mixed and combined. The dealer designates one of the players to cut, and the plastic insert card is placed so that the last 60 to 75 cards or so will not be used. (Not dealing to the bottom of all the cards makes it more difficult for professional card counters to operate effectively.)

#### THE DEAL
When all the players have placed their bets, the dealer gives one card face up to each player in rotation clockwise, and then one card face up to themselves. Another round of cards is then dealt face up to each player, but the dealer takes the second card face down. Thus, each player except the dealer receives two cards face up, and the dealer receives one card face up and one card face down. (In some games, played with only one deck, the players' cards are dealt face down and they get to hold them. Today, however, virtually all Blackjack games feature the players' cards dealt face up on the condition that no player may touch any cards.)

#### NATURALS
If a player's first two cards are an ace and a "ten-card" (a picture card or 10), giving a count of 21 in two cards, this is a natural or "blackjack." If any player has a natural and the dealer does not, the dealer immediately pays that player one and a half times the amount of their bet. If the dealer has a natural, they immediately collect the bets of all players who do not have naturals, (but no additional amount). If the dealer and another player both have naturals, the bet of that player is a stand-off (a tie), and the player takes back his chips.

If the dealer's face-up card is a ten-card or an ace, they look at their face-down card to see if the two cards make a natural. If the face-up card is not a ten-card or an ace, they do not look at the face-down card until it is the dealer's turn to play.

#### THE PLAY
The player to the left goes first and must decide whether to "stand" (not ask for another card) or "hit" (ask for another card in an attempt to get closer to a count of 21, or even hit 21 exactly). Thus, a player may stand on the two cards originally dealt to them, or they may ask the dealer for additional cards, one at a time, until deciding to stand on the total (if it is 21 or under), or goes "bust" (if it is over 21). In the latter case, the player loses and the dealer collects the bet wagered. The dealer then turns to the next player to their left and serves them in the same manner.

The combination of an ace with a card other than a ten-card is known as a "soft hand," because the player can count the ace as a 1 or 11, and either draw cards or not. For example with a "soft 17" (an ace and a 6), the total is 7 or 17. While a count of 17 is a good hand, the player may wish to draw for a higher total. If the draw creates a bust hand by counting the ace as an 11, the player simply counts the ace as a 1 and continues playing by standing or "hitting" (asking the dealer for additional cards, one at a time).

#### THE DEALER'S PLAY
When the dealer has served every player, the dealers face-down card is turned up. If the total is 17 or more, it must stand. If the total is 16 or under, they must take a card. The dealer must continue to take cards until the total is 17 or more, at which point the dealer must stand. If the dealer has an ace, and counting it as 11 would bring the total to 17 or more (but not over 21), the dealer must count the ace as 11 and stand. The dealer's decisions, then, are automatic on all plays, whereas the player always has the option of taking one or more cards.
