## Key Points:

- When a class' `.new` method is called to create an object instance, the `.initialize` method is passed all arguments to initialize the instance's state.
- instance variable names are prefixed with `@`.
- instance variables default to `nil` until they are explicitly set.
- instance variables are private by default, and they should be manipulated with getters and setters

```ruby
class Backpack
  initialize(owner)
    @owner = owner
  end

  def owner
    @owner
  end

  def owner=(new_owner)
    @owner = new_owner
  end
end
```

- Methods named with a trailing `=` are recognized as setters by Ruby, and allow the syntactic "sugar" use of the assignment syntax, e.g. `Backpack.new("Sven").owner = "Ayah"`. Notice the space between `owner` and `=` while the actual method name is `owner=`.
- Getters and setters can be created using the `attr_reader`, `attr_writer`, and `attr_accessor` methods:
  - `attr_reader`: Create getters for the symbols listed
  - `attr_writer`: Create setters for the symbols listed
  - `attr_accessor`: Create getters and setters for the symbols listed

```ruby
class Backpack
  attr_accessor :owner

  initialize(owner)
    @owner = owner
  end
end
```

- Why use getters and setters rather than the instance variable directly?
  - If there was a typographical error (we call these "typo") in the previous example (e.g. `@ownar`), it would fail silently, potentially introducing a bug into the system.
  - Getters and setters make this explicit, and will raise an error when a typo is made

## References

### Initializing object instances

- [Ruby Guides: Initialize Method][rg-initialize-method]

### Instance variables

- [Ruby For Beginners: Instance variables][rfb-instance-variables]
- [Ruby Guides: Instance variables][rg-instance-variables]
- [Ruby User's Guide: Instance variables][rug-instance-variables]
- [Geeks for Geeks: Ruby Getters and Setters Methods][gfg-getter-setters]
- [Mix & Go: Ruby's attr_accessor, attr_reader, attr_writer][mg-attr]

[mg-attr]: https://mixandgo.com/learn/ruby_attr_accessor_attr_reader_attr_writer
[rfb-instance-variables]: http://ruby-for-beginners.rubymonstas.org/writing_classes/instance_variables.html
[rg-initialize-method]: https://www.rubyguides.com/2019/01/ruby-initialize-method/
[rg-instance-variables]: https://www.rubyguides.com/2019/07/ruby-instance-variables/
[rug-instance-variables]: https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/instancevars.html
[gfg-getter-setters]: https://www.geeksforgeeks.org/ruby-getters-and-setters-method/
