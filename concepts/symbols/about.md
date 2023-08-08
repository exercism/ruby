# About

[Symbols][symbols] are named identifiers that can be used to refer to a value.
Symbols are created through a symbol literal, which is by prefixing a name with a `:` character, e.g. `:foo`.
They also allow for being written as strings, e.g. `:"foo"`, which allows for example spaces in the name.

```ruby
:foo # => :foo
:"foo boo" # => :"foo boo"
```

Symbols are used in many places in the language, including as keys in hashes, to represent method names and variable names.

## Identifier

What makes symbols different from strings is that they are identifiers, and not data or text.
This means that two symbols with the same name are always the same object.

```ruby
"foo".object_id # => 60
"foo".object_id # => 80
:foo.object_id # => 1086748
:foo.object_id # => 1086748
```

## Modifying Symbols

Symbols are immutable, which means that they cannot be modified.
This means that when you "modify" a symbol, you are actually creating a new symbol.
There are a few methods that can be used to manipulate symbols, they all return new symbols.
All methods can be found in the [Symbol API][symbols-api].

```ruby
:foo.upcase # => :FOO

:foo.object_id # => 1086748
:foo.upcase.object_id # => 60
```

The benefit of symbols being immutable is that they are more memory efficient than strings, but also safer to use as identifiers.

## Conversion

Symbols can be converted to strings and vice versa.
This can be useful when you want to modify a symbol, or when you want to use a symbol as a string.
To present a symbol as a string, you can use the `String#to_sym` method, and to do the opposite, you can use the `Symbol#to_s` method.
Due to symbols having a limited set of methods, it can be useful to convert a symbol to a string to use string methods on it, if a new symbol is needed.

```ruby
:foo.to_s # => "foo"
"foo".to_sym # => :foo
```

## Getting names in scopes

In Ruby you can get names in scopes by using various methods to get names of constants, methods, and variables.
These methods returns arrays of symbols.

Some methods are `Module#constants`, `Module#instance_methods`, `Module#class_variables`, `global_variables` and `local_variables`.

```ruby
module Foo
  BAR = 1
  def self.baz; end
end

a = 1

Foo.constants # => [:BAR]
Foo.instance_methods # => [:baz]

local_variables # => [:a]
```

All methods can be found in the [Kernel API][kernal-api] and [Module API][module-api].

[symbols]: https://www.rubyguides.com/2018/02/ruby-symbols/
[symbols-api]: https://rubyapi.org/o/symbol
[kernal-api]: https://rubyapi.org/o/kernel
[module-api]: https://rubyapi.org/o/module
