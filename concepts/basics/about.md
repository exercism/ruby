# About

Ruby is a dynamic and strongly typed language. In dynamic languages the type of a variable or object is resolved at runtime, which means that its value or type can be changed up to the very last moment (when it gets parsed by the interpreter).
And what do we mean with strongly typed? Once we know the type of a variable or object, Ruby is strict about what you can do with it, for example:

```ruby
x = '2'
y = x + 'n'
# =>  '2n'
```

**But**

```ruby
x = '2'
y = x + 2
# => TypeError (no implicit conversion of Integer into String)
```

Remember, in Ruby everything is an object. Even classes are instances of the class `Class`. For example:

```ruby
1.class
# => Integer

Integer.is_a?(Object)
# => true

Class.is_a?(Object)
# => true
```

This means that we can also define classes like this:

```ruby
Car = Class.new do
  def run
    'running'
  end
end

Car.new.run
# => 'running'
```

Finally, bear in mind that the `Integer` object holds values that may be defined as one or more (consecutive) digits and its methods support many of the [mathematical operators][integers-docs].

[integers-docs]: https://ruby-doc.org/core-2.7.0/Integer.html

```exercism/note
The communication in documentation often will reference instance methods using syntax like `Class#method_name` while class or module level methods are referenced as `Class::method_name`.
The `::` is called the _Scope Resolution Operator_, the constant or method at the class or module level being referenced.
You will encounter this in the Ruby documentation, and in mailing lists and other support areas.
You will find that we reference class and module methods in our writing as `ClassName.method_name` or `ModuleName.method_name`, instead.
```
