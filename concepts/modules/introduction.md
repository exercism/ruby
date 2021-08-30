# Introduction

Some times you don't need the overhead of creating an object with state.
In these cases, a `module` can be used.

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