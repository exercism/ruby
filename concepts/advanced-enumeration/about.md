# About

## More enumeration methods

In Enumeration, you were introduced to the `count`, `any?`, `select`, `all` and `map` enumeration methods.
Here's a recap of those, with a few extras added:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number > 20 }   #=> false
fibonacci.none?  { |number| number > 20 }   #=> true
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
fibonacci.select { |number| number >= 5}    #=> [5, 8, 13]
fibonacci.find   { |number| number >= 5}    #=> 5

# Some methods work with or without a block
fibonacci.sum  #=> 33
fibonacci.sum {| number | number * number }  #=> 273

# There are also methods to help with nested arrays:
animals = [ ['cat', 'bob'], ['horse', 'caris'], ['mouse', 'arya'] ]
animals.flatten  #=> ["cat", "bob", "horse", "caris", "mouse", "arya"]
```

## Enumerating Hashes

Enumerating `Hash` objects is exactly the same as enumerating `Array` objects, except that the block receives two arguments: the key and the value:

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.each { |animal, name| ... }
```

If you only need one of the values, you can use the special `_` symbol to indicate that one value is not needed.
This helps both in terms of developer clarity and also is a performance optimisation.

```ruby
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.map { |_, name| name }  #=> ["bob, "caris", "arya"]
```

## Nested Enumerations

You can also enumerate in nested blocks, and daisy chain methods together.
For example, if we have an array of hashes of animals, and we want extract the animals with short names, we might want to do something like:

```ruby
pets = [
  { animal: "cats", names: ["bob", "fred", "sandra"] },
  { animal: "horses", names: ["caris", "black beard", "speedy"] },
  { animal: "mice", names: ["arya", "jerry"] }
]

pets.map { |pet|
  pet[:names].select { |name| name.length <= 5 }
}.flatten.sort
#=> ["arya", "bob", "caris", "fred", "jerry"]
```
