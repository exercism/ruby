# Introduction

An `if` statement can be used to conditionally execute code:

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
