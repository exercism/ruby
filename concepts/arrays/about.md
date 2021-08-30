# About

Data structures that can hold zero or more elements are known as _collections_. An **array** in Ruby is a collection that maintains the ordering in which its objects are added. Arrays can hold any object. Objects can be added to an array or retrieved from it using an index. Ruby array indexing is zero-based, meaning that the first element's index is always zero:

```ruby
# Declare an array containing two values
two_ints = [1,2]

# Assign first and second element by index
two_ints[0] = 7
two_ints[1] = 8

# Retrieve the second element by index
two_ints[1] # => 8

# Check the length of the array
two_ints.size # => 2
```

In Ruby there are multiple ways of creating an Array:

- Using the literal constructor `[]` _(most common)_
- Explicitly calling `Array.new`
- Calling the Kernel `Array()` method

The `Array.new` method supports two optional arguments: the initial size of the array and a default object.

When a size and default are provided, the array is populated with `size` copies of default object.

```ruby
a = Array.new(2, Hash.new)
# => [{}, {}]
```

Since all the Array elements store the same hash, changes to one of them will affect them all.

```ruby
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {"cat"=>"feline"}]

a[1]['cat'] = 'Felix'
a # => [{"cat"=>"Felix"}, {"cat"=>"Felix"}]
```

If multiple copies are what you want, you should use the block version which uses the result of that block each time an element of the array needs to be initialized:

```ruby
a = Array.new(2) {Hash.new}
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {}]
```

Another characteristic of Ruby arrays is that they mix in the [Enumerable][enumerable-module] module, which adds a lot of handy methods to iterate, search, sort, filter, etc. elements of an array.

[enumerable-module]: https://ruby-doc.org/core-2.7.1/Enumerable.html
[for-loop]: https://launchschool.com/books/ruby/read/loops_iterators#forloops
