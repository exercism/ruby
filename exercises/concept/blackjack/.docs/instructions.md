# Instructions

In this exercise we will simulate the first turn of a [Blackjack][blackjack] game.

## 1. Calculate the value of any given card.

You will receive two cards and will be able to see the face up card of the dealer.
All cards are represented using a string such as "ace", "king", "three", "two", etc. The values of each card are:

| card  | value |  card   | value |
| :---: | :---: | :-----: | :---: |
|  ace  |  11   |  eight  |   8   |
|  two  |   2   |  nine   |   9   |
| three |   3   |   ten   |  10   |
| four  |   4   |  jack   |  10   |
| five  |   5   |  queen  |  10   |
|  six  |   6   |  king   |  10   |
| seven |   7   | _other_ |   0   |

~~~~exercism/note
Commonly, aces can take the value of 1 or 11 but for simplicity we will assume that they can only take the value of 11.
~~~~

Implement the method `Blackjack.parse_card` which takes a card as a string as an argument.
The method should return the value of the card as an integer.

```ruby
Blackjack.parse_card("ace")
# => 11
```

## 2. Name ranges of values.

The player score has to be categorized into ranges of values.
Player scores are computed by adding up the values of the two player cards.
The ranges that are used are:

|   range   |  value   |
| :-------: | :------: |
|    low    | [4, 11]  |
|    mid    | [12, 16] |
|   high    | [17, 20] |
| blackjack |   [21]   |

Implement the method `Blackjack.card_range` which takes two cards as strings as arguments.
The method should return the name of the range of values the two cards fall into.

```ruby
Blackjack.card_range("ten", "king")
# => "high"
```

## 3. Implement the decision logic for the first turn.

Depending on your two cards and the card of the dealer, there is a strategy for the first turn of the game, in which you have the following options:

- Stand (S)
- Hit (H)
- Split (P)
- Automatically win (W)

Although not optimal yet, you will follow the strategy your friend Alex has been developing, which is as follows:

- If you have a pair of aces you must always split them.
- If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win.
  If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
- If your cards sum up to a value within the range [17, 20] you should always stand.
- If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
- If your cards sum up to 11 or lower you should always hit.

Implement the method `Blackjack.first_turn` which takes three cards as strings as arguments.
The method should return the decision you should take as a string.

```ruby
Blackjack.first_turn("ace", "ace", "two")
# => "P"
```

[blackjack]: https://en.wikipedia.org/wiki/Blackjack
