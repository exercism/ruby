# Instructions

In this exercise you will be building error handling for a simple calculator.

The goal is to have a working calculator that returns a string with the following pattern: `16 + 51 = 67`, when provided with arguments `16`, `51` and `+`.

```ruby
SimpleCalculator.calculate(16, 51, "+")
# => "16 + 51 = 67"
SimpleCalculator.calculate(32, 6, "*")
# => "32 * 6 = 192"
SimpleCalculator.calculate(512, 4, "/")
# => "512 / 4 = 128"
```

## 1. Handle the code that may raise errors within the method `calculate`

The main method for implementation in this task will be the class method `SimpleCalculator.calculate()` method.
It takes three arguments.
The first two arguments are numbers on which an operation is going to be conducted.
The third argument is of type string and for this exercise it is necessary to implement the following operations:

- addition using the `+` string
- multiplication using the `*` string
- division using the `/` string

## 2. Handle illegal operations

Update the `SimpleCalculator.calculate()` method to raise an `UnsupportedOperation` exception for unknown operation symbols.

```ruby
SimpleCalculator.calculate(1, 2, '-')
# => Raises an UnsupportedOperation
```

## 3. Handle invalid arguments

Update the `SimpleCalculator.calculate()` method to raise an `ArgumentError` exception for invalid argument types.

```ruby
SimpleCalculator.calculate(1, '2', '*')
# => Raises an ArgumentError
```

## 4. Handle DivideByZero exceptions

Update the `SimpleCalculator.calculate()` to handle `ZeroDivisionError` exceptions.
The handling code should return the string with the content `Division by zero is not allowed.`.
Any other exception should not be handled by the `SimpleCalculator.calculate()` method.

```ruby
SimpleCalculator.calculate(512, 0, "/")
# => returns "Division by zero is not allowed."
```
