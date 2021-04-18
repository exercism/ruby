# Introduction

## Arrays

In Ruby, **arrays** are ordered, integer-indexed collections of any object.
Array indexing starts at `0`.
A negative index is assumed to be relative to the end of the array — e.g.. an index of `-1` indicates the last element of the array, `-2` is the next to last element in the array, and so on.

### Creating arrays

Arrays are normally created using the `[]` notation.
They can create any different type of object.

```ruby
array = [1, "two", 3.0]
```

### Element Reference

Elements in an array can be retrieved their indexes using the `#[]` method.
This returns the element at index, or returns a subarray starting at the start index and continuing for a specified length.
Negative indices count backward from the end of the array.

```ruby
a = [ "a", "b", "c", "d", "e" ]

a[2]       #=> "c"
a[6]       #=> nil
a[1, 3]    #=> [ "b", "c", "d" ]

a[-1]      #=> "e"
a[-2]      #=> "d"
a[-3, 2]   #=> ["c", "d"]
```

### Helper Methods

There are lots of useful helper methods on arrays.
Here are some of the more common:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.size      #=> 8
fibonacci.sum       #=> 33
fibonacci.reverse   #=> [13, 8, 5, 3, 2, 1, 1, 0]
```

## Enumeration

Rather than using loops to iterate through collections, in Ruby we use enumeration.

Enumeration is the act of stepping through a collection (in this case an array) and performing some action on each object.  Enumeration is a key concept in Ruby and is used for things like sorting, grouping, mapping, reducing, and much more.

An enumeration to print each word in an array would look like this:

```ruby
words = ["the", "cat", "sat"]
words.each do |word|
  puts word
end

# Output
the
cat
sat
```

In this example, we have called the `.each` method on our array and passed in a _block_ that takes one paramater (`word`) and prints it out.

We'll look at _blocks_ in much more depth later in the Track, but for now think of them as anonymous functions that can take zero or more arguments.
They can be defined using the `do...end` syntax (above), or the `{}` syntax (below).

Here are some other examples of array methods that use blocks:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number == 6 }   #=> false
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20? }  #=> true
fibonacci.map    { |number| number * 2  }   #=>  [0, 2, 2, 4, 6, 10, 16, 26]
```
