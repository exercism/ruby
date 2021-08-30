# Introduction

## Instance Variables

Objects can hold their own state by setting _instance variables_.
These variables live within an object are normally used to store some internal state.

Instance variables always start with an `@`.
You can create a new instance variable by setting a variable starting with an `@`.
For example:

```ruby
class Repeater
  def hear(something)
    # Save what's been heard into a new instance variable called @heard
    @heard = something
  end

  def repeat
    # Outputs the value of the instance variable
    print @name
  end
end

repeater = Repeater.new
repeater.hear("Hello, friend!")
repeater.repeat # Prints "Hello, friend!"
```

Objects usually set their initial state in an `initialize` method, which is automatically called when calling `new` on a class.

```ruby
class Airplane
  def initialize
    @wings = 2
  end

  def number_of_wings
    @wings
  end
end

plane = Airplane.new
plane.wings # returns 2
```

The `initialize` method may also take arguments, so that each instance can start with a custom state:

```ruby
class Suitcase
  def initialize(locked)
    @locked = locked
  end
end
```

It is good practice to consider _instance_ variables to be private from external read and writes.
We instead methods define methods to get and set their values.
For example:

```ruby
class Suitcase
  def initialize
    @locked = false
  end

  def locked? # Query methods should be named with a trailing `?`
    @locked
  end

  def lock! # Methods which mutate state should have trailing `!`
    @locked = true
  end
end

suitcase = Suitcase.new
suitcase.locked? # false
suitcase.lock!
suitcase.locked? # true
```

## Nil

[Nil][nil-dictionary] is an English word meaning "nothing" or "zero".
In Ruby, `nil` is used to express the _absence_ of an object.
In other programming languages, `null` or `none` values may play a similar role.

```ruby
# I do not have a favorite color
favorite_color = nil
```

Ruby gives any instance variable the default value of `nil` when it is first encountered, until it is otherwise given a value.

```ruby
print @favourite_color # prints nil
@favourite_color = "blue"
print @favourite_color # prints "blue"
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
