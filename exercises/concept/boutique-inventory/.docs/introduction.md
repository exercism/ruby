Enumeration is the act of stepping through a collection (Array, Hash, etc) and performing some action on each object.
Enumeration is a key concept in Ruby and is used for sorting (`sort_by`), grouping (`group_by`), mapping (`map`), reducing (`reduce`), and much more. You'll most frequently see enumeration as the idiomatic way iterating through collections rather than using loops.

A simple enumeration to print each word in an array would look like this:

```ruby
words = %w[the cat sat on the mat]
words.each do |word| 
  print word 
end

#=> the
#=> cat
#=> ...
#=> mat
```

In this example, we have called the Array's `each` method and passed in a _block_, which takes one parameter (`word`) and prints it. Blocks are small groupings of statements that can be executed multiple times. They can be thought of as closures or anonymous functions. Blocks are defined using the `do...end` syntax (above), or the `{}` (below). The styles are interchangeable and differing opinions exist about when each should be used.

We can also chain enumerable methods. For example, we can chain `.with_index` onto `each` to print out the index of an object as well as it's value:

```ruby
words = %w[the cat sat on the mat]
words.each.with_index { |word, index| print "#{index}: #{word}" }

#=> 0. the
#=> 1. cat
#=> ...
#=> 5. mat
```

Enumerating hashes is exactly the same as enumerating arrays, except that the block receives two parameters: the key and the value:

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
words.each { |animal, name| ... }

# The two params should be put in brakets when chaining
words.each.with_index { |(animal, name), index| ... }
```

The various enumeration methods can be seen in the docs for the the [Enumerable Module](https://ruby-doc.org/core-2.7.1/Enumerable.html) which is part of Arrays, Hashes, etc.
