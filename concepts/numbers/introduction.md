# Introduction

Two common types of numbers in Ruby are:

- Integers: numbers with no digits behind the decimal separator (whole numbers). Examples are `-6`, `0`, `1`, `25`, `976` and `500_000`.
- Floating-point numbers: numbers with zero or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`, (they also can use the `_` as a separator for readability as shown above such as `1_024.0`).

They are implemented through the `Integer` and `Float` classes.

The `Float` and `Integer` classes have methods that will coerce values from one to the other. `Integer` numbers are precise to a whole unit, while `Float` has precision that is fractional to a whole number.
