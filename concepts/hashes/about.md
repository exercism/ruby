# About

[Hashes][hash] are also known as dictionary or map in other languages, they are a mutable unsorted collection which maps keys to values.
Each key is unique and is used to retrieve the corresponding value.
The keys can be of any data type which is hashable (has a `hash` method), this includes strings, numbers, and most data types and objects in Ruby.

Even though Hashes are unordered collections, [Ruby maintains the insertion order of key-value pairs][entry_order].
This means that when you iterate over a `Hash`, the pairs will be returned in the order they were added.
However, deleting elements may affect the order of remaining elements.
Hashes behavior of maintaining insertion order was introduced in Ruby [1.9][ruby-1.9].

## Creating Hashes

You can create a `Hash` using curly braces `{}` with key-value pairs formed as `key => value` and separated by commas:

```ruby
my_hash = {"name" => "Alice", "age" => 30, "city" => "New York"}
```

You can also mix and match different types of keys and values:

```ruby
my_hash = {1 => "one", :two => 2, "three" => [3, "three"]}
```

Alternatively if the keys are symbols, you can use a more the newer syntax which was introcued in Ruby 1.9:

```ruby
my_hash = {name: "Alice", age: 30, city: "New York"}
```

You can create an empty `Hash` using the `Hash.new` method:

```ruby
empty_hash = Hash.new
```

## Accessing values

You can access values in a `Hash` instance using its corresponding keys, the syntax reminds of array indexing, but using the key instead of an index:

```ruby
my_hash = {"name" => "Alice", "age" => 30, "city" => "New York"}
my_hash["name"]
# => "Alice"
```

If the key does not exist in the `Hash` instance, the `[]` method will return `nil`:

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash["city"]
# => nil
```

If the disired behavior is to not return `nil` for non-existing keys, another way of accessing values is by using the [`fetch`][fetch] method, which allows you provide a default value for non-existing keys.
If the `fetch` method is used without a default value and the key does not exist, it will raise a `KeyError` exception.

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.fetch("city", "Unknown")
# => "Unknown"

my_hash.fetch("city")
# => KeyError: key not found: "city"
```

## Modifying

You can add or update key-value pairs in a `Hash` instance by assigning a value to a key using the assignment operator `=`.
Assigning a value to an existing key will update the value, while assigning a value to a new key will add a new key-value pair:

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash["city"] = "New York"
my_hash["age"] = 31          

my_hash
# => {"name" => "Alice", "age" => 31, "city" => "New York"}
```

## Default values

When fetching a value with `[]` for a key that does not exist in the `Hash` instance, Ruby returns `nil` by default.

```ruby
my_hash = {"name" => "Alice"}
my_hash["age"]
# => nil
```

This might not always be desirable, so you can set a default value for the `Hash` instance using `Hash.new(default_value)`.
See that the default value is returned only for keys that do not exist in the `Hash` instance.

```ruby
my_hash = Hash.new("unknown")
my_hash["name"] = "Alice"
my_hash["age"]
# => "unknown"

my_hash["name"]
# => "Alice"
```

~~~~exercism/note
Be cautious when using mutable objects (like Arrays or other Hashes) as default values, as they can lead to unexpected behavior.
~~~~

## Deleting key-value pairs

You can delete a key-value pair from a `Hash` instance using the [`delete`][delete] method, which takes the key as an argument:

```ruby
my_hash = {"name" => "Alice", "age" => 30, "city" => "New York"}
my_hash.delete("age")
my_hash
# => {"name" => "Alice", "city" => "New York"}
```

## Methods

There are several useful instance methods available for Hashes in Ruby.
Here are some commonly used ones:

### `has_value?` and `include?`

You can check if a `Hash` instance contains a specific value using the [`has_value?`][has_value?] method.

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.has_value?(30)
# => true
my_hash.has_value?(25)
# => false
```

You can check if a `Hash` instance contains a specific key using the [`include?`][include?] method.

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.include?("name")
# => true
my_hash.include?("city")
# => false
```

### `keys` and `values`

You can retrieve all the keys of a `Hash` instance using the [`keys`][keys] method, which returns an array of keys.

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.keys
# => ["name", "age"]
```

You can retrieve all the values of a `Hash` instance using the [`values`][values] method, which returns an array of values.

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.values
# => ["Alice", 30]
```

## Iterating over Hashes

You can iterate over the key-value pairs in a `Hash` instance using the `each_pair` method.
This will give you access to both the key and the value for each pair:

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.each_pair do |key, value|
  puts "#{key}: #{value}"
end
# Output:
# name: Alice
# age: 30
```

You can also iterate over just the keys or just the values using the [`each_key`][each_key] or [`each_value`][each_value] methods, respectively:

```ruby
my_hash = {"name" => "Alice", "age" => 30}
my_hash.each_key do |key|
  puts key
end
# Output:
# name
# age
```

[entry_order]: https://docs.ruby-lang.org/en/master/Hash.html#class-Hash-label-Entry+Order
[each_pair]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-each_pair
[each_key]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-each_key
[keys]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-keys
[each_value]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-each_value
[values]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-values
[has_value?]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-has_value-3F
[include?]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-include-3F
[hash]: https://docs.ruby-lang.org/en/master/Hash.html
[fetch]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-fetch
[delete]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-delete
[ruby-1.9]: https://ruby-doc.org/3.4/NEWS/NEWS-1_9_1.html
