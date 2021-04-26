# Introduction

## Enumerating Hashes

Enumerating `Hash` objects is exactly the same as enumerating `Array` objects, except that the block receives two arguments: the key and the value:

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
words.each { |animal, name| ... }

# The two arguments should be put in brakets when chaining
words.each.with_index { |(animal, name), index| ... }
```
