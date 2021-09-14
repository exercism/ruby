# Introduction

## Modules

So far all the exercises you have seen have used classes.
Sometimes we do not need the overhead of creating an object with state, so instead we use `module`.

A module is very similar to a class (in fact, `Module` is `Class`' parent in the object hierarchy) - the main difference being that rather than using instance methods, we use class methods.
Class methods start with `self.` and are directly called on a module.

A module is very similar to a class (in fact, `Module` is `Classes` parent in the object hierarchy) - the main difference being that rather than using instance methods, we use class methods.
Class methods start with `self.` and are directly called on a module. 
For example:

```ruby
module Speaker
  def self.echo(something)
    "#{something} ... #{something}"
  end
end

Speaker.echo("Hello")   #=> "Hello ... Hello"
```

## Loops

There are several ways to write loops in Ruby, but as we tend to use enumeration rather than looping in general, the most commonly seen loop is the `while` loop:

```ruby
counter = 0

while counter < 5
  counter += 1
end
```

You can also use its sibling `until`
```ruby
counter = 0

until counter == 5
  counter += 1
end
```
