# Introduction

This exercise will teach the fundamental building blocks of Ruby.
It covers a lot of ground, but do not worry if it feels overwhelming, we will go into everything in much more depth as we continue through the track.

One of the key things to understand about Ruby is that it is an [object-oriented language][object-oriented-programming], and that **everything in Ruby is an [object][object]**. Numbers, strings, arrays - they're all objects.

## Variables and Constants

We tend to make use of objects by assigning them names, either using variables or constants.

Variables are always written in [snake case][snake-case].
A variable can reference different objects over its lifetime.
For example, `my_first_variable` can be defined and redefined many times using the `=` operator:

```ruby
my_first_variable = 1
my_first_variable = "Some string"
my_first_variable = SomeComplexObject.new
```

Constants, however, are meant to be assigned once.
They must start with capital letters and are normally written in block capitals with words separated by underscores.
For example:

```ruby
MY_FIRST_CONSTANT = 10

# Redefining not allowed
# MY_FIRST_CONSTANT = "Some String"
```

## Classes

Ruby is organised into classes.
Classes are defined using the `class` keyword followed by the name of the class.
Objects are generally created by instantiating classes using the `.new` method.
For example:

```ruby
# Define the class
class Calculator
  #...
end

# Create an instance of it and assign it to a variable
my_first_calc = Calculator.new
```

## Methods

Units of functionality are encapsulated in methods - similar to _functions_ in other languages.

A method can be defined with positional arguments, keyword arguments (which are defined and called using the `:` syntax) or have no arguments at all.

Methods either implicitly return the result of the last evaluated statement, or can explicitly return an object via the `return` keyword.

```ruby
class Calculator

  # Positional arguments
  def add(num1, num2)
    return num1 + num2 # Explicit return
  end

  # Keyword arguments
  def multiply(num1:, num2:)
    num1 * num2 # Implicit return
  end
end
```

Methods are invoked using `.` syntax:

```ruby
calc = Calculator.new
calc.add(1, 3)
calc.multiply(num1: 2, num_2: 5)
```

[object-oriented-programming]: https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/oothinking.html
[object]: https://github.com/exercism/v3/blob/main/reference/concepts/objects.md
[snake-case]: https://en.wikipedia.org/wiki/Snake_case
