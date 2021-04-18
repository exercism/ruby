# Introduction

## True and False

True and false logical states are represented with `true` and `false` in Ruby. 

```ruby
happy = true
sad = false
```

## Equality and comparison

Ruby allows you to compare objects to each other using the normal equality symbols:
- Use `==` to see if two objects are equal
- Use `>` to see if the object on the left is **greater than** the object on the right
- Use `<` to see if the object on the left is **less than** the object on the right.
- Use `>=` or `<=` to test for "greater than or equal to" and "less than or equal to" respectively.

You can also use boolean logic with the normal operators:
- Use `&&` or `and` to check if `x and y` are true
- Use `||` or `or` to check if `x or y` is true.
- Use `!` or `not` to invert equality - e.g. `x != y` (x does not equal y)

Here are some examples:
```ruby
# Is "true equal to false"? 
true == false # false

# Is "true not equal to false"
true != false # true

# Is 5 greater than 4?
5 > 4 # true

# Is 3 less than or equal to 2?
3 <= 2 # false
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
