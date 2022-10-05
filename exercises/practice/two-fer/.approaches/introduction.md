# Introduction

## Default Parameter

The key to this exercise is the optional parameter in the method definition.
Using a default value there, rather than a conditional, makes the code much more readable, simple, and idiomatic.
This is a typical, idiomatic solution:

```ruby
module TwoFer
  def self.two_fer(name = 'you')
    "One for #{name}, one for me."
  end
end
```

## Method definition

You can use `class` instead of `module` and use metaclasses instead of `self`, `module_function`, or extend `self`.

## String method

Solutions can also use string templates with `Kernel#sprintf`, `Kernel#format` or `String#%`

```ruby
module TwoFer
  module_function
​
  def two_fer(name = 'you')
    format('One for %<name>s, one for me.', name: name)
  end
end
```
