# Last Will

Welcome to Last Will on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Namespaces

An important method for code organization is the use of namespaces.
Classes and modules can be namespaces.
Two methods might have a naming collision, which can be resolved by putting them in different namespaces.
Namespaces can be nested, which might help to structure big code bases.
Access to the namespaces is done via the scope-resolution operator `::`.

The example below shows the use of two different `foo` methods.
They are used together by prefixing their respective namespaces.

```ruby
class MyNs
    def self.foo
        44
    end
    class MyInnerNs
        def self.baz
            90
        end
    end
end
class MyOtherNs
    def self.foo
        -2
    end
end

p MyNs::foo + MyOtherNs::foo * MyNs::MyInnerNs::baz
```

## Instructions

You work for a prestigious law firm that is specialized in handling unique testament requests.

In this exercise, you are going to open a mysterious vault.
You are the executor of the estate and will assemble the long-kept secret codes of three families to get an account number and the matching code.

To prevent any family from opening the vault alone, it can only be opened by combining their knowledge with a secret modifier that you know from the last will.

You have three tasks, all related to helping the families to open the vault.

## 1. Take your seat in front of the families and lay out your papers

Define a namespace called `EstateExecutor`.
The code from the next tasks should be defined in the body of the `EstateExecutor` namespace.

```ruby
class SomeName
    # The space between the class/module name
    # and the `end` keyword
    # is called body of the  namespace.
end
```

## 2. Find the secret account number

This is your big moment.
Only you have the secret modifier key to reveal the secret account number.

Define the `assemble_account_number(secret_modifier)` method that takes the `Integer` secret modifier as an argument and returns the `Integer` assembled account number.

To get the correct number, you have to sum up the `bank_number_part` from each of the three families.

## 3. Last step: Enter the secret code

The instructions in the testament ask you to add all the blue and then all the red fragments.
The resulting code is obtained by multiplying both sums.

Define the `assemble_code` method that returns the resulting code by combining the fragments from the three families to a single `Integer` result.
The method does not have any arguments and relies solely on the information in the relevant namespaces from the families.

## Source

### Created by

- @vaeng (original C++ exercise)
- @vaiapatta1985 (transcription to Ruby)