# Introduction

Like everything in Ruby, a `String` is an object.
Strings are made up of an arbitrary sequence of bytes (normally characters) and are initialized and manipulated like any other object.
In fact, one of the most useful things about Ruby is the numerous methods that can be called on strings (and other objects) to save you a lot of time writing code. 
In this method we're going to explore and play with some of those helper methods.

## Creating a string.

Although you can use `String.new(...)` to create a string, it is much more common to use a literal.
There are lots of different literals you can use - but the split into two categories: those that allow interpolation and those that don't.

The most common literals are single and double quotes (`'...'` and `"..."`). 
Single quotes do not allow interpolation, whereas double quotes do. 
Interpolation is where one string is included in another using the `#{}` syntax.

```
# Use single quotes when not interpolated
location = 'World'

# And double quotes when interpolated
puts "Hello, #{location}!"   #=> "Hello, World!"
```

You can also use other literals such `%{... }` for interpolated strings and `%q{...}` for non-interpolated strings.
These are useful if your strings have the characters `'` or `"` in them.

_Note: There's no absolute rule saying you have to use non-interpolated strings if your string does not contain interpolation._

## Interacting with strings

It is helpful to think of Strings in Ruby in a similar way to how you think of Arrays.
They have a size and their characters are indexed (with `0` as the first index):

```ruby
str = "Some string"

str.size   #=> 11

str[0]    #=> 'S'
str[1]    #=> 'o'
str[-1]   #=> 'g'

# Find the first index of a character
str.index('m')   #=> 2
```

Parts of strings can be extracted using indexes or `slice`:
```ruby
str = "Some string"

# Find three characters starting with the second character (index 1)
str[1, 3]         #=> "ome"
str.slice(1, 3)   #=> "ome"
```

The semantic values of strings can also be manipulated.
It's worth exploring the [Ruby docs][docs-string] to learn about all the methods, but here are a few commonly used examples:
```
"hello".capitalize   #=> "Hello"
"HELLO".downcase     #=> "hello"
"hello".center(9)    #=> "  hello  "
"  hello  ".strip    #=> "hello"

"hello world".split(" ")   #=> ["hello", "world"]
```

You can also use methods such as `gsub` to substitute characters:
```
# Replace one character with another
"noob".gsub("o","0")   #=> "n00b"

# (Advanced) Replace a regular expression
"ruby really rocks".gsub(/[aieou]/,'')   #=> "rby rlly rcks"
```

In all of the examples above, a new string is returned.
However, many methods have equivalents which end in `!` which actually modify the string itself.

```
# Use normal methods to return new strings
str = "hello"
str.capitalize   #=> "Hello"
puts str         #=> "hello"

# And bang-methods (...!) to modify the object
str = "hello"
str.capitalize!  #=> nil
puts str         #=> "HELLO"
```

[docs-string]: https://ruby-doc.org/core-2.7.0/String.html
