In Ruby, **arrays** are ordered, integer-indexed collections of any object. Array indexing starts at `0`. A negative index is assumed to be relative to the end of the array — i.e. an index of `-1` indicates the last element of the array, `-2` is the next to last element in the array, and so on.
Ruby arrays mix in the [Enumerable module][enumerable-module], which adds several traversal and searching methods, and with the ability to sort.

### Create array.

- An array in Ruby can contain different types of objects.

```ruby
array = [1, "two", 3.0] #=> [1, "two", 3.0]
```

### Element Assignment

Elements can accessed or changed using indexes. Subarrays can be accessed by specifying a start index and a size.

```ruby
a = ["", "", "", "", ""]

a[4] = "hello"  #=> [nil, nil, nil, nil, "hello"]
a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "hello"]
```

- Negative indices will count backward from the end of the array.

```ruby
a = ['a', 'b']

a[-1] = "Z"
a #=> ["a", "Z"]
```

### Element Reference

- Elements in an array can be retrieved using the #[] method. It returns the element at index, or returns a subarray starting at the start index and continuing for length elements.

```ruby
a = [ "a", "b", "c", "d", "e" ]

a[2]    #=> "c"
a[6]    #=> nil
a[1, 2] #=> [ "b", "c" ]
```

- Negative indices count backward from the end of the array (-1 is the last element)

```ruby
a = [ "a", "b", "c", "d", "e" ]

a[-2]    #=> "d"
a[-3, 3] #=> [ "c", "d", "e" ]
```

### Obtaining Information about an Array

Arrays keep track of their own length at all times. To query an array about the number of elements it contains, use length, count or size.

```ruby
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count  #=> 5
browsers.size   #=> 5
```

### Adding Items to Arrays

Items can be added to the end of an array by using either push or <<

```ruby
arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]
```

### Removing Items from an Array

The method pop removes the last element in an array and returns it

```ruby
arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr     #=> [1, 2, 3, 4, 5]
```

[enumerable-module]: https://ruby-doc.org/core-2.7.1/Enumerable.html