## Advanced

It is typical to call [#to_enum](http://ruby-doc.org/core-2.3.1/Object.html#method-i-to_enum) when defining methods for a generic Enumerable, in case no block is passed.

Here is an additional test you could add:

```ruby
def test_accumulate_squares_when_no_block_is_passed
  skip
  enum = [1, 2, 3].accumulate
  assert_instance_of Enumerator, enum

  result = enum.each { |number| number * number }
  assert_equal [1, 4, 9], result
end
```
