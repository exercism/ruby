# Hash Objects

## What is a hash?

Hashes are a very handy way to store and access data in key-value pairs.
They allow for rapid access to a value based on a key.

```ruby
my_hash = {}
# => {}

another_hash = {"favorite_fruit" => "apple"}
another_hash["favorite_fruit"]
# => "apple"

another_hash["favorite_vegetable"] = nil
# => nil
another_hash
# => {"favorite_fruit" => "apple", "favorite_vegetable" => nil}
```

## Types of keys

In ruby a key may be a single value of any type.

```ruby
my_hash = {"string" => 1, :symbol => 2, 100 => 3, [] => 5}
```

You may also use composite values as a key:

```ruby
my_hash = {[1, 2, 3] => "do re mi"}
my_hash[1, 2, 3]
# => "do re mi"
```

When using symbols as keys, an alternate literal form is preferred:

```ruby
{a: 1, b: 2, c: 3}
```

## Some useful methods

The standard library for the [Hash class][rubydoc-hash] is rich and offers many useful methods to manipulate and transform hash values to accomplish your task:

```ruby
my_hash = {first: 1, second: 2, third: 3}
# => {first: 1, second: 2, third: 3}
my_hash.values
# => [1, 2, 3]
```

[rubydoc-hash]: https://ruby-doc.org/core-2.6.6/Hash.html
