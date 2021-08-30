# Introduction

`OpenStruct` allows you to easily create an object from a `Hash`. 
Rather than having to access using `Hash` keys, `OpenStruct` instead allows us to use methods to access and set values.


```ruby
attributes = { name: "Jeremy Walker", age: 21, location: "Nomadic" }
person = OpenStruct.new(attributes)

person.name
#=> Jeremy Walker

person.location
#=> Nomadic

# Update the age
person.age = 35

# It sets correctly
person.age
#=> 35
```

One bonus to this approach is that we can take advantage of a shortcut when using block syntax. 
In situations where a block calls a single method, you can replace the block with `&:` followed by the method name. 
For example, these two lines are synonymous:

```ruby
people.sum { |person| person.age }
people.sum(&:age)
```

## Standard Library

All of the classes you've seen in previous exercises have been part of Ruby's Core Library.

OpenStruct is part of Ruby's Standard Library (often shortened to "stdlib") - a collection of classes for working with things such as dates, json, and networking.
It also provides some useful functionality for making your code easier to work with.

When using classes that are not from the Core Library — your own code in different files, classes from stdlib, or external dependencies — we need to import them using the `require` method before we can use them.
For example:

```ruby
require 'ostruct'

person = OpenStruct.new(name: "Jeremy Walker")
# ...
```


