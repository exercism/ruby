# Design

## Goal

The goal of this exercise is to teach the student how the concept of numbers is implemented in Ruby. It will introduce this concept through the two most common numeric types in Ruby: [`Integer`][integer-ruby] (whole number) and [`Float`][float-ruby] (floating-point number).

## Learning objectives

- Know of the existence of `Integer` and `Float`.
- Understand that an `Integer` represents whole numbers, and a `Float` represents floating-point numbers.
- Know of basic operators such as multiplication, comparison and equality.
- Know how to conditionally execute code using an `if`, `unless` or `case` statement.

## Out of scope

- Any other numeric types besides `Integer` and `Float` (so no `Rational`, `Complex`, `BigDecimal`, etc.).
- Parsing an instance of `String` to an instance of `Integer` or `Float`.
- Coercing an instance of `Integer` or `Float` to an instance of `String`.

## Concepts

The Concepts this exercise unlocks are:

- `numbers`: know of the existence of the two commonly used number types, `Integer` and `Float`; understand that the former represents whole numbers, and the latter floating-point numbers; know of basic operators such as multiplication, comparison and equality; know how to coerce one numeric type to another
- `conditionals`: know how to conditionally execute code using an `if`, `unless` or `case` statement.

## Prerequisites

This exercise's prerequisite Concepts are:

- `booleans`: know about `true`/`false` and truthy/falsey values.

## Representer

This exercise does not require any specific representation logic to be added to the [representer][representer].

## Analyzer

This exercise does not require any specific logic to be added to the [analyzer][analyzer].

[integer-ruby]: https://ruby-doc.org/core-2.7.1/Integer.html
[float-ruby]: https://ruby-doc.org/core-2.7.1/Float.html
[analyzer]: https://github.com/exercism/ruby-analyzer
[representer]: https://github.com/exercism/ruby-representer
