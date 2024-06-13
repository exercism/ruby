# Ranges

[Ranges][range] represent an interval between two values.
The most common types that support ranges are `Integer` and `String`.
They can be used for many things like quickly creating a collection, slicing strings, checking if a value is in a range, and iteration.
They are created using the range operator `..` or `...` (inclusive and exclusive, respectively).

```ruby
1..5  # => 1..5
1...5 # => 1...5

(1..5).to_a # => [1, 2, 3, 4, 5]
(1...5).to_a # => [1, 2, 3, 4]
```

The reason for having two range operators is to allow to create ranges that are inclusive or exclusive of the end value, which can be useful when for example working with indexes that are zero based.

Ranges can also be created using the `Range` constructor, `new`.

```ruby
Range.new(1, 5) # A range containing 1, 2, 3, 4, 5
```

~~~~exercism/note
When creating a range in Ruby using the range operators `..` or `...`, and wanting to call a method on the range, you need to wrap the range in parentheses.
This is because, otherwise, the method will be called on the 2nd argument of the range operator.

```ruby
(1..5).sum # => 15
1..5.sum # => Error: undefined method `sum' for 5:Integer (NoMethodError)
```
~~~~

## Getting substrings

When wanting to slice a string, you can use the range operator to get a substring.
That is, by creating a range with the start and end index of the sub-string.

```ruby
"Hello World"[0..4] # => "Hello"
"Hello World"[6..10] # => "World"
```

You can also use negative indexes to get the substring from the end of the string.

```ruby
"Hello World"[-5..-1] # => "World"
"Hello World"[6..-4] # => "Wo"
```

## Range methods

Ranges do have a set of methods that can be used to work with them.
For example, these methods can be used to get the sum of all the values in the range or check if the range includes a value.

| Method                  | Description                                                             | Example                         |
| ----------------------- | ----------------------------------------------------------------------- | ------------------------------- |
| [`sum`][sum]            | Returns the sum of all the values in the range                          | `(1..5).sum # => 15`            |
| [`size`][size]          | Returns the size of the range                                           | `(1..5).size # => 5`            |
| [`include?`][indlude]   | Returns `true` if the range includes the given value, otherwise `false` | `(1..5).include?(3) # => true` |

## Endless & Beginless ranges

A range can be endless and beginless.
The endless or beginless range has their start or end value being `nil`, but when defining the range the `nil` can be omitted.

Using beginless and endless ranges is useful when you want to, for example, slice a string from the beginning or to the end.

```ruby
"Hello World"[0..] # => "Hello World"
"Hello World"[4..] # => "o World"
"Hello World"[..5] # => "Hello "
```

~~~~exercism/caution
If not used on a collection, the endless range can cause an endless sequence, if not used with caution.
~~~~

## String ranges

Strings can also be used in ranges and allow one to get an interval of strings between two strings.
Its behavior can be a bit unexpected when using certain strings, so use it with caution.

```ruby
("aa".."az").to_a # => ["aa", "ab", "ac", ..., "az"]
```

[range]: https://rubyapi.org/o/range
[sum]: https://rubyapi.org/o/enumerable#method-i-sum
[size]: https://rubyapi.org/o/range#method-i-size
[indlude]: https://rubyapi.org/o/range#method-i-include-3F
