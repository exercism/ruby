Blocks are small groupings of statements that can be executed multiple times. 
They can be thought of as closures or anonymous functions. 
Blocks are defined using the `do...end` syntax (above), or the `{}` (below). 
The styles are interchangeable and differing opinions exist about when each should be used.

## Shortcut Syntax
In situations where a block calls a single method, you can replace the block with `&:` followed by the method name. For example, these two lines are synonymous:

```
people.sum { |person| person.age }
people.sum(&:age)
```
