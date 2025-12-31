# Advanced

It is typical to call [#to_enum][to_enum] when defining methods for a generic Enumerable, in case no block is passed.

Here is an additional test you could add:

```ruby
def test_accumulate_when_block_is_deferred
  skip
  accumulate_enumerator = [1, 2, 3].accumulate
  accumulated_result = accumulate_enumerator.map do |number|
    number * number
  end
  assert_equal [1, 4, 9], accumulated_result
end
```

[to_enum]: https://docs.ruby-lang.org/en/master/Object.html#method-i-to_enum
