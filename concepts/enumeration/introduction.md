# Introduction

Enumeration is the act of stepping through a collection (`Array`, `Hash`, etc) and performing some action on each object.

Enumeration is a key concept in Ruby and is used for sorting (`sort_by`), grouping (`group_by`), mapping (`map`), reducing (`reduce`), and much more. 
You'll most frequently see enumeration as the idiomatic way iterating through collections rather than using loops.

A simple enumeration making use of `map` and `with_index` looks like this:

```ruby
words = %w[the cat sat on the mat]
list = words.map.with_index do |word, index| 
  "#{index} #{word}"
end

puts list

# Output:
# 0. the
# 1. cat
# 2. sat
# 3. on
# 4. the
# 5. mat
```
