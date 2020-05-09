One of the key aspects of working with numbers in Ruby is the distinction between integers (numbers with no digits after the decimal separator) and floating-point numbers (numbers with zero or more digits after the decimal separator).
They are implemented through the [`Integer`][integer-ruby] and [`Float`][float-ruby] class.

```ruby
a = 1
b = 1.0
a.class
#=> Integer
b.class
#=> Float
```

- Arithmetic is done using the basic [arithmetic operators][arithmetic-operators] (`+`, `-`, `*`, `/`). Numbers can be compared using the standard [comparison operators][comparison-operators].
- Basic arithmetic operations between instances of `Integer`, will always result in an instance of `Integer`.
- Basic arithmetic operations between instances of `Float` will result in other instances of `Float`.
- Basic arithmetic operations between instances of `Integer` and instances of `Float` will result in instances of `Float`.
- The `Float` and `Integer` classes have methods that will coerce values from one to the other. `Integer` numbers are precise to a whole unit, while `Float` has precision that is fractional to an whole number. This means that coercing a float to an integer may result in loss of precision.

```ruby
4.9.to_i
#=> 4

5.to_f
#=> 5.0

7 - 3.0
#=> 4.0

2 == 4
#=> false

1.0 == 1
#=> true
```

An `if` statement can be used to conditionally execute code. The condition of an `if` statement does not have to be only `true` or `false`. It can be any value. But it's important to know that any value other than `nil` and `false` (_truthy_ values) will be treated as `true`, meaning that the code inside the `if` statement will be executed.

```ruby
x = 5

if x == 5
  # Execute logic if x equals 5
elsif x > 7
  # Execute logic if x greater than 7
else
  # Execute logic in all other cases
end
```

Sometimes you want to execute a statement (or statements) if a condition is _not_ true, for situations like that, Ruby implements the `unless` keyword:

```ruby
x = 4
unless x == 5
  # Execute logic if x does not equal 5
else
  # Execute logic if x == 5
end
```

If you want to execute different code depending on the value of a variable, Ruby's `case` statement might come useful:

```ruby
y = 5
case y
when 3
  # Execute logic if y equals 3
when 5
  # Execute logic if y equals 5
else
  # Execute logic in all other cases
end
```

The same problem can sometimes be solved using different types of conditional statements, sometimes one might be more suited for the problem than the other. It's a good idea to stop for a moment and also consider the other two options when using any of the three conditional statements.

[arithmetic-operators]: https://www.tutorialspoint.com/ruby/ruby_operators.htm
[comparison-operators]: https://www.w3resource.com/ruby/ruby-comparison-operators.php
[if-else-unless]: https://www.w3resource.com/ruby/ruby-if-else-unless.php
[integer-ruby]: https://ruby-doc.org/core-2.7.1/Integer.html
[float-ruby]: https://ruby-doc.org/core-2.7.1/Float.html
