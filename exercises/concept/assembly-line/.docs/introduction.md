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

In this exercise you must conditionally execute logic. 
A common way to do this in Ruby is by using an `if/else` statement:

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
