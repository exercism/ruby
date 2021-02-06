Objects can hold their own state by setting _instance variables_, which are created by prefixing `@` to a variable name.

```ruby
@name = 2
```

Objects usually set their initial state in an `initialize` method, which is automatically called when calling `new` on a class.

```ruby
class Airplane
  def initialize
    @wings = 2
  end
end
```

The `initialize` method may also take arguments, so that each instance can start with a custom state:

```ruby
class Suitcase
  def initialize(locked)
    @locked = locked
  end
end
```

Consider _instance_ variables to be private from external read and writes. _Instance_ methods should be used for getting and setting instance variables:

```ruby
class Suitcase
  #...

  def locked? # Query methods should be named with a trailing `?`
    @locked
  end

  def unlock! # Methods which mutate state should have trailing `!`
    @locked = false
  end
end
```
