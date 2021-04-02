# Instructions

You are a huge fan of the [Numberphile Youtube channel](https://www.youtube.com/watch?v=PeUbRXnbmms) and you just saw a cool video about the _Lucas Number Sequence_. You want to create this sequence using Elixir.

While designing your function, you want to make use of _lazy evaluation_, so that you can generate as many numbers as you want, but only if you need to -- So you decide to use an enumerator:

## 1. Create an enumerator

When creating the `LucasNumbers` object, create an enumerator which you can access with `sequence`

```ruby
LucasNumbers.new.sequence
# => #<Enumerator: #<Enumerator::Generator:0x000055c6d9793bc8>:each>
```

## 2. Return the first two numbers

You know from the video that the first two numbers of the Lucas Numbers sequence are `2` then `1`. When the sequence enumerator's `next` method is called, return those first

```ruby
sequence = LucasNumbers.new.sequence
sequence.next
# => 2
sequence.next
# => 1
```

## 3. Create the generalized case

You also know that after the first two numbers, you can generate the next number by adding the previous two numbers.

```ruby
sequence = LucasNumbers.new.sequence
sequence.next
# => 2
sequence.next
# => 1
sequence.next
# => 3
sequence.next
# => 4
```

## 4. Return a finite sequence

To avoid repetitive calls to `sequence.next`, you decide to implement a `to_a` method which takes an integer and returns an array with the first `n` numbers from the Lucas Numbers sequence

```ruby
LucasNumbers.new.to_a(5)
# => [2, 1, 3, 4, 7]
LucasNumbers.new.to_a(7)
# => [2, 1, 3, 4, 7, 11, 18]
```

## 5. Catch bad arguments

Later, you find someone is using your function and having problems because they are using incorrect arguments. Create a better developer experience by providing better feedback when this happens. Add a guard clause to raise an error if a non-integer or an integer less than `0` is used to generate the sequence:

```elixir
LucasNumbers.new.to_a("Hello world!")
# => ArgumentError (count must be an integer greater than or equal to 0)
LucasNumbers.new.to_a(-1)
# => ArgumentError (count must be an integer greater than or equal to 0)
```
