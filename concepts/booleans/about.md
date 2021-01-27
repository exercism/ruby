## True, False

- `true` and `false` are used to represent boolean logical states.
  - They are singleton instances of the [`TrueClass`][true-class] and [`FalseClass`][false-class] objects.
  - they may occur as literals in code, or as the result of logical (`&&`, `||`, `!`) or [comparison][comparable-class] (`<`, `>`, `==`) methods.

## _Truthy_ and _falsey_

- When not using strict Boolean values, _truthy_ and _falsey_ evaluation rules are applied:

  - Only `false` and `nil` evaluates as _falsey_.
  - Everything else evaluates as _truthy_.

  ```ruby
  # A simplified definition
  def falsey
    nil || false
  end

  def truthy
    not falsey
  end
  ```

[c-family]: https://en.wikipedia.org/wiki/List_of_C-family_programming_languages
[control-expressions]: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Control_Structures
[true-class]: https://docs.ruby-lang.org/en/master/TrueClass.html
[false-class]: https://docs.ruby-lang.org/en/master/FalseClass.html
[nil-class]: https://docs.ruby-lang.org/en/master/NilClass.html
[comparable-class]: https://docs.ruby-lang.org/en/master/Comparable.html
[constants]: https://www.rubyguides.com/2017/07/ruby-constants/
[integer-class]: https://docs.ruby-lang.org/en/master/Integer.html
[kernel-class]: https://docs.ruby-lang.org/en/master/Kernel.html
[methods]: https://launchschool.com/books/ruby/read/methods
[returns]: https://www.freecodecamp.org/news/idiomatic-ruby-writing-beautiful-code-6845c830c664/
