Enumeration is the act of stepping through a collection (`Array`, `Hash`, etc) and performing some action on each object.

Enumeration is a key concept in Ruby and is used for sorting (`sort_by`), grouping (`group_by`), mapping (`map`), reducing (`reduce`), and much more. 
You'll most frequently see enumeration as the idiomatic way iterating through collections rather than using loops.

A simple enumeration to print each word in an array would look like this:

```ruby
words = %w[the cat sat on the mat]
words.each do |word| 
  puts word 
end

# Output
the
cat
sat
on
the
mat
```

In this example, we have called the `Array#each` method and passed in a _block_, which takes one parameter (`word`) and prints it. 

We can also chain enumerable methods. 
For example, we can chain `.with_index` onto `each` to print out the index of an object as well as it's value:

```ruby
words = %w[the cat sat on the mat]
list = words.map.with_index { |word, index| "#{index}: #{word}" }
puts list

# Output
0. the
1. cat
...
5. mat
```

Enumerating `Hash` objects is exactly the same as enumerating `Array` objects, except that the block receives two arguments: the key and the value:

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
words.each { |animal, name| ... }

# The two arguments should be put in brakets when chaining
words.each.with_index { |(animal, name), index| ... }
```

The methods described above are part of the [`Enumerable` module](https://ruby-doc.org/core-2.7.1/Enumerable.html) which is included in `Array`, `Hash` and other classes that require the ability to enumerate.
