# Introduction

## Numbers

The two most common types of numbers in Ruby are:

- **Integers:** numbers with no digits behind the decimal separator (whole numbers). Examples are `-6`, `0`, `1`, `25`, `976` and `500000`.
- **Floating-point numbers:** numbers with one or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`.

They are implemented through the `Integer` and `Float` classes.

These classes have methods that will coerce values from one to the other. `Integer` numbers are precise to a whole unit, while `Float` has precision that is fractional to a whole number:
- `Integer#to_f`: Coerce to a new float
- `Float#ceil`: Round up to the nearest integer
- `Float#floor`: Round down to the nearest integer
- `Float#round`: Round to the nearest integer
- `Float#to_i`: Truncate to the nearest integer

## Conditionals

Ruby has what is known as flow control expressions, these are used to control the way the program will run and they take a truthy or falsey value.
There are operators that can be used to create truthy or falsey values, these are known as [comparison operators][comparison-operators].

There are two main control expressions that are used to control which code will run and which will not.
Also known as which given branch will run.

Those two are: `if` and the `unless` expression.

## Comparison operators

[Comparison operators][comparison-operators] are used to compare values and return a `true` or `false` value.
The following operators require two values to be compared of the same type.
If the values are not of the same type then the compiler will throw an error.
Here is a list of the operators and an example of when they give a `true` value:

| Method | Description           | Example |
| ------ | --------------------- | ------- |
| <      | less than             | 5 < 4   |
| <=     | less than or equal    | 4 <= 4  |
| >      | greater than          | 3 > 1   |
| >=     | greater than or equal | 2 >= 2  |

The equal and not equal operators can be used to compare any type of value contrary to the operators already mentioned.
The `==` operator is used to check if two values are equal, and that includes checking the type of the value.
The `!=` works the same way but it will return `true` if the values are not equal and `false` if they are equal.
Here is a list of the equal and not equal operators and an example of when they give a `true` value:

| Method | Description  | Example |
| ------ | ------------ | ------- |
| ==     | equal        | 4 == 4  |
| !=     | not equal    | 5 != 4  |

## If statement

The [`if`][if] statement is used to check if a given condition is "truthy" or "falsey".
If the condition is truthy then the code inside the if statement will run.
An `if` statement ends with the `end` keyword.

```ruby
value = 1
if value == 1
  "1 is equal to 1"
end
# => "1 is equal to 1"

if value > 2
  "1 is greater than 2"
end
# => nil
```

## Unless statement

The `unless`unless statement works very similarly to the `if` statement but it will run the code inside the `unless` statement if the condition is falsey.

```ruby
value = 1
unless value == 1
  "1 is not equal to 1"
end
# => nil

unless value > 2
  "1 is not greater than 2"
end
# => "1 is not greater than 2"
```

## Else statement

The `else` statement can be used in conjunction with the `if` statement.
The `else` statement will be executed if the `if` branch is not executed.

```ruby
value = 1
if value == 1
  "1 is equal to 1"
else
  "1 is not equal to 1"
end
# => "1 is equal to 1"
```

## "Cascading-if" statements

The `elsif` statement can be used in conjunction with the if statement.
The `elsif` statement will be executed if the if branch is not executed and the condition of the elsif statement is truthy.
Elsif statements can be chained together and the first truthy condition will be executed.
There can also be an else statement at the end of the if statement which will run if non of the earlier statement has been true.

```ruby
value = 1
if value != 1
  "1 is not equal to 1"
elsif value > 2
  "1 is greater than 2"
else
  "1 is not equal to 1 and 1 is not greater than 2"
end
# => "1 is not equal to 1 and 1 is not greater than 2"
```

[comparison-operators]: https://www.w3resource.com/ruby/ruby-comparison-operators.php
[if]: https://www.rubyguides.com/ruby-tutorial/ruby-if-else/
