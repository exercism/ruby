# Debug

When a test fails, a message is displayed describing what went wrong and for which input.
You can inspect arbitrary values in your program by passing them to the `debug` method.
This will capture the values and show you the output.

```ruby
debug "The value is #{value}."
debug "The input is #{input.inspect}"
```
