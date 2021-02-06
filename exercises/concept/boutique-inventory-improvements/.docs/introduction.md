Ruby comes with a Standard Library (often shortened to "stdlib") - a collection of classes for working with things such as dates, json, and networking.
It also provides some useful functionality for making your code easier to work with.

`OpenStruct` is part of the Standard Library and allows you to easily create an object from a `Hash`. Rather than having to access using `Hash` keys, `OpenStruct` instead allows us to use methods to access and set values.

When using classes from the Standard Library, or any other library, you need to require that class using the `require` method.

```ruby
require 'ostruct'

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

One bonus advantage of this is that you can take advantage of a shortcut when using block syntax. In situations where a block calls a single method, you can replace the block with `&:` followed by the method name. For example, these two lines are synonymous:

```
people.sum { |person| person.age }
people.sum(&:age)
```
