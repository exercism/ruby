## True and False

True and false logical states are represented with `true` and `false` in Ruby. These may either be used as literals on their own, or as a result of logical or comparison methods.

```ruby
happy = true
sad = false

true && false
# => false

1 < 2
# => true
```

## _Truthy_ and _falsey_

When evaluating objects in `if` statements or other boolean contexts, all objects evaluate as _truthy_ **except** for `false` and `nil`.

```ruby
def falsey
  nil || false
end

def truthy
  not falsey
end
```

[nil-dictionary]: https://www.merriam-webster.com/dictionary/nil
