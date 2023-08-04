# Hints

## 1. Create the ports identifier

- You need to define a [constant][constants] that should contain the symbol value specified in the instructions.

## 2. Get identifiers for other ports

- A string can be [slice][slice] to get parts of it.
- `Strings` have a [method][upcase] to upcase the letters.
- `Strings` have a [method][to_sym] to convert a string to a symbol.

## 3. Determine which terminal a ship should dock at

- Symbol has a [method][to_s] to convert a symbol to a string.
- A string can be [slice][slice] to get parts of it.
- Use conditional [`if`][doc-if], to check if the ship is carrying `"OIL"` or `"GAS"`.

[doc-if]: https://ruby-doc.org/core/syntax/control_expressions_rdoc.html#label-if+Expression
[constants]: https://www.rubyguides.com/2017/07/ruby-constants/
[upcase]: https://ruby-doc.org/core/String.html#method-i-upcase
[slice]: https://ruby-doc.org/core/String.html#class-String-label-String+Slices
[to_s]: https://rubyapi.org/symbol#method-i-to_s
[to_sym]: https://rubyapi.org/string#method-i-to_sym
