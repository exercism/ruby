# About

## `while`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  while current_balance < desired_balance
    current_balance = annual_balance_update(current_balance)
    years += 1
  end
  years
end
```

## `until`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  until current_balance >= desired_balance
    current_balance = annual_balance_update(current_balance)
    years += 1
  end
  years
end
```

## `loop`

```ruby
def self.years_before_desired_balance(current_balance, desired_balance)
  years = 0
  loop do
    current_balance = annual_balance_update(current_balance)
    years += 1
    return years if current_balance >= desired_balance
  end
end
```

As you have probably noticed, Ruby has no increment operator (`i++`) like some other languages do. Instead, constructs like `i += 1` (which is equal to `i = i + 1`) can be used.

[0.30000000000000004.com]: https://0.30000000000000004.com/
[evanw.github.io-float-toy]: https://evanw.github.io/float-toy/
