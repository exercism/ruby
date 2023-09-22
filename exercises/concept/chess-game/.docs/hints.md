# Hints

## 1. Define rank & file range

- You need to define two [constant][constants] that should hold a [`Range`][range] of ranks and files.
- The ranks should be an [`Integer`][integers] `range` from 1 to 8.
- The files should be a [`String`][string] `Range` from 'A' to 'H'.
- The constant needs to be defined in the `Chess` [module][module].

## 2. Check if square is valid

- You need to check if a value is within a range.
- There is [a method][include] that can be used to check if a value is within a range.

## 3. Get player's nickname

- You can get a slice by using a `Range` as input.
- There is a [method][upcase] that can be used to upcase a string.

## 4. Create move message

- You can index the square string to get the rank and file.
- You can use already defined methods to get the nickname of the player and to check if the move is valid.

[constants]: https://www.rubyguides.com/2017/07/ruby-constants/
[integers]: https://rubyapi.org/o/integer
[string]: https://rubyapi.org/o/string
[module]: https://rubyapi.org/o/module
[include]: https://rubyapi.org/o/range#method-i-include-3F
[range]: https://rubyapi.org/o/range
[upcase]: https://rubyapi.org/o/string#method-i-upcase
