A floating-point number is a number with zero or more digits behind the decimal separator. Examples are `4.0`, `0.1`, `3.14`, `-6.4` `16.984025` and `1024.0`. In Ruby, floating-point numbers are implemented through the [Float](https://ruby-doc.org/core-2.7.0/Float.html) class.

You can find a short introduction to floating-point numbers at [0.30000000000000004.com][0.30000000000000004.com].

The [Float Toy page][evanw.github.io-float-toy] has a nice, graphical explanation how a floating-point numbers' bits are converted to an actual floating-point value.

To repeatedly execute logic, one can use loops. In this example the `while` loop is useful because it keeps on looping _while_ a condition evaluates to some truthy value (i.e. not `false` or `nil`). Ruby implements a loop similar to the `while` loop. It's called the `until` loop, and you've probably guessed what it does. It keeps looping _until_ a boolean condition evaluates to `true`. In some languages, to make a piece of code execute an unlimited number of times, constructs like `while true` are used. In Ruby, the `loop` loop exists for that purpose. Even though the `loop` loop does not depend on a single condition, it can be canceled by using a `return` or `break` keyword.

The `#years_before_desired_balance` method from the previous exercise could have been written by using any of the three mentioned loops:

### `while`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  while current_balance < desired_balance
    current_balance = annual_balance_update(current_balance)
    years += 1
  end
  years
end
```

### `until`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  until current_balance >= desired_balance
    current_balance = annual_balance_update(current_balance)
    years += 1
  end
  years
end
```

### `loop`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  loop do
    current_balance = annual_balance_update(current_balance)
    years += 1
    return years if current_balance >= desired_balance
  end
end
```

As you have probably noticed, Ruby has no increment operator (`i++`) like some other languages do. Instead, constructs like `i += 1` (which is equal to `i = i + 1`) can be used.

[0.30000000000000004.com]: https://0.30000000000000004.com/
[evanw.github.io-float-toy]: https://evanw.github.io/float-toy/
