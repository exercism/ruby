# Case

[Case][case] (often referred to as switch in other languages) is a form of control expression like if-else.
Case allows for chaining of multiple if-else-if statements and can be more readable while still providing flow control.

A case is defined by the keyword `case` followed by an optional expression.
Then for each case, the keyword `when` is used followed by an expression which is compared to the case expression.
The `when` keyword should not be indented from the `case` keyword.
After the `when` keyword is the code that should be executed if the case expression matches the when expression.
Case allows for an optional `else` statement which is executed if no other case matches.

The case expression is evaluated and then compared to each `when` expression.
The expression is compared using the case equality operator (`===`).

```ruby
value = 1
case value
when 1
  "One"
when 2
  "Two"
else
  "Other"
end

# This is the same as:
value = 1
if 1 === value
  "One"
elsif 2 === value
  "Two"
else
  "Other"
end
```

## Case equality operator (`===`)

The case equality operator (`===`) is a bit different from the equality operator (`==`).
The operator checks if the right side is a member of the set described by the left side.
This means that it does matter where each operand is placed.
How this works depends on the type of the left side, for example a `Range` would check if the right side is in the range or a `Object` would check if the right side is an instance of the `Object`.

```ruby
(1..3) == 1  # => false
(1..3) === 1 # => true

String == "foo"  # => false
String === "foo" # => true
```

## Case with multiple expressions

Cases allow for matching multiple expressions in a single case with each possible value separated by a comma.
It will execute the code if any of the expressions match.
This can be useful when you want a single case to have multiple possible values.

```ruby
case var
when 1, 2
  "One or two"
else
  "Other"
end
```

## Cases with ranges

Cases can also check if a value is in a range.
This is done by having a range as the when expression.

```ruby
case var
when 1..3
  puts "One to three"
else
  puts "Other"
end
```

## Cases with no case expression

When there is no need for a case expression, it is possible to omit it.
Doing this will make it so that each case expression is evaluated for truthiness.
And makes them behave like if-else-if statements.

```ruby
case
when 1 == 1
  "One is equal to one"
when 1 > 2
  "One is greater than two"
else
  "Other"
end
```

## Single line when

Ruby allows for single line case statements.
This can be used when you have a simple single line statement.
The single line when statement is written as `when <expression> then <statement>`.
And when used in the else statement it is written as `else <statement>`.

```ruby
case var
when 1 then "One"
when 2 then "Two"
else "Other"
end
```

## Case with types

Case allows for the matching with types.
This is useful when wanting different behavior depending on the type of a variable.

```ruby
case var
when Integer
  "Integer"
when String
  "String"
else
  "Other"
end
```

[case]: https://www.rubyguides.com/2015/10/ruby-case/
