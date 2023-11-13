# Hints

## 1. Calculate the value of any given card.

- The `Blackjack.parse_card` method should take a string (e.g. `"ace"`) and return its value (e.g. 11).
- Define a [`case` statement][case] and assign the value of the card as the case's value.
- King, Queen, Jack and 10 can be handled with a single case.
- The `case` can have an `else` case.
  In any case the function should return `0` for unknown cards.

## 2. Name ranges of values.

- Compute the player score by adding up the values of the two player cards.
- Define a [`case` statement][case] and assign the name of the range as the case's value.
- The switch can use [`Range`][range] objects as cases to check if a value is in a range.

## 3. Implement the decision logic for the first turn.

- Compute the player score by adding up the values of the two player cards.
- You can either use a big [`case` statement][case] on the player
  score (maybe with nested `if`-statements on the dealer-score in some cases),
- or you could distinguish separate player score categories (say "small hands"
  with a score less than 12, "medium hands" with a score in the range 12..20 and
  "large hands" with a score greater than 20) and write separate functions for
  all (or some) of these categories.

[case]: https://www.rubyguides.com/2015/10/ruby-case/
[range]: https://rubyapi.org/o/range
