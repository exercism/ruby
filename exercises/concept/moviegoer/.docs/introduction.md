# Introduction

A ternary conditional in Ruby is a shorter way of writing simple `if/else` statements. If an `if/else` statement contains only two branches, one for when the condition is true and one for when it is false, it can be re-written as a ternary conditional.

It uses a combination of the `?` and `:` symbols, often called the ternary operator(s).

For example:

```ruby
if traffic_light == 'green'
  cross_the_road
else
  wait
end
```

can be re-written as:

```ruby
traffic_light == 'green' ? cross_the_road : wait
```

The code on the left side of the `?` is the condition and the code on the right contains the two possible branches, separated by the `:`. If the condition is _true_, the code on the _left_ side of the `:` is executed; if the condition is _false_, then the code on the _right_ of the `:` gets executed.
