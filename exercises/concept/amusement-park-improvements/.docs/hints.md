## General

Review:

- [Ruby for beginners: Nothingness and the truth][rfb-nothingness-and-truth]

## 1. Check if an attendee has a ride pass

- Convert the pass_id to a boolean object.
- Look at the [`BasicObject`][basicobject-class] class, it contains methods which most classes inherit.

## 2. Check if an attendee fits a ride

- Compare the ride's minimum height to the attendee's height.
- Look at the [`Comparable`][comparable-module] module, it contains methods for comparing objects which can be used when they are included.
  - The [Integer][integer-class] class includes the [`Comparable`][comparable-module] module.

## 3. Check if an attendee is allowed to ride

- Combine the instance methods you've created using a [boolean operator][pr-boolean-operator] to return the result.

[pr-boolean-operator]: https://ruby-doc.com/docs/ProgrammingRuby/html/tut_expressions.html#UG
[rfb-nothingness-and-truth]: http://ruby-for-beginners.rubymonstas.org/conditionals/nothing_and_truth.html
[basicobject-class]: https://docs.ruby-lang.org/en/master/BasicObject.html
[comparable-module]: https://docs.ruby-lang.org/en/master/Comparable.html
[integer-class]: https://docs.ruby-lang.org/en/master/Integer.html
[kernel-class]: https://docs.ruby-lang.org/en/master/Kernel.html
[methods]: https://launchschool.com/books/ruby/read/methods
