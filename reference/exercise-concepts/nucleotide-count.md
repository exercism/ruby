# Concepts of nucleotide-count

## General

- class level methods: used as the starting point of the exercise. They may be named with `self.method_name` notation or with a `self` block. Another way of creating class methods is extending a module.
- module methods: depending on the approach, they may be used instead of the class methods.
- factory pattern and object creation: the method `from_dna` may be used to create instances of the main class.
- instance variables: store the common value/state for the instance.
- accessors: `att_reader` may be used to access instance variables.
- access modifiers: `private` may be used to restrict access to the readers.
- method definition: the `histogram` method needs to be defined.
- method arguments: the method `from_dna` needs an argument.
- strings: one string is passed as the input so it may be necessary to know about strings and string manipulation.
- mixins: one way of solving this exercise is including the `Enumerable` module so it may be necessary to know about Ruby mixins like `Enumerable` or `Comparable`.
- loops: it may be necessary to iterate over the input data using loops and indexes.
- collections: may be used to iterate or transform the input data. Some collections' methods that may be used: `inject, each, each_with_object, count`
- exceptions: necessary to raise an exception if the input is not valid.
- return values: methods need to return values either implicitly or explicitly.
- constants: constants may be used to store static information like DNA values.
- namespaces: namespaces may be used along with constants.
- conditional statements: conditional statements may be used to check if the input is valid.
- blocks: they are used in any of the `Enumerable` methods.
- regular expressions: may be used to validate the input.

## Approach: use `Enumerable` mixin

- Make the class that represents the nucleotides strand to include `Enumerable` so that all `Enumerable` methods are available.
- Requires implementation of `each` method. See [Enumerable mixin documentation](https://ruby-doc.org/core-2.7.0/Enumerable.html)

## Approach: Use collections + `Enumerable` methods.

- Use `Enumerable#count` to count nucleotide occurrences.
- Use `String#chars` and `Enumerable#each_with_object` to create the histogram

## Approach: Use indexes to loop over the chars.

- Similar to the previous approach but using indexes and loops to iterate over an `Array` of characters.

## Approach: Use collections + String#count and Regex.

- Use `String#count` to count nucleotide occurrences.
- Initialize a hash for the histogram then use `Enumerable#each` and `String#count` to fill it.
- Use Regex to validate the input.

## Approach: Use collections + String#count.
- Similar to the previous approach but using `String#count` and `String#size` to validate the input.
- For the input validation part it's also possible to use array difference to remove nucleotides from the input resulting in an empty collection for the valid inputs.

