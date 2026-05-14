# Introduction

# Namespaces

An important method for code organization is the use of namespaces.
Classes and modules can be namespaces.
Two methods might have a naming collision, which can be resolved by putting them in different namespaces.
Namespaces can be nested, which might help to structure big code bases.
Access to the namespaces is done via the scope-resolution operator `::`.

The example below shows the use of two different `foo` methods.
They are used together by prefixing their respective namespaces.

```ruby
class MyNamespace
  def self.foo
    44
  end

  class MyInnerNamespace
    def self.baz
      90
    end
  end
end

class MyOtherNamespace
  def self.foo
    -2
  end
end

p MyNamespace::foo + MyOtherNamespace::foo * MyNamespace::MyInnerNamespace::baz  # => -136
```

Note that namespaces are interpreted based on where the executing code is.
To refer to something in the *root* namespace, (ie outside all defined namespaces), start with `::`.

For example:

```ruby
class Example
  def self.example
    5
  end
end

class MyNamespace

  class Example
    def self.example
      10
    end
  end

  def self.call_example
    p Example::example  # => 10
    p ::Example::example  # => 5
  end
end
```
