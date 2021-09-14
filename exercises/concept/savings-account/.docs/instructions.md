# Instructions

In this exercise you'll be working with savings accounts. Each year, the balance of a savings account is updated based on the interest rate. The interest rate the bank gives depends on the amount of money in the accounts (its balance):

- -3.213% for a negative balance.
- 0.5% for a non-negative balance less than `1000` dollars.
- 1.621% for a positive balance greater or equal than `1000` dollars and less than `5000` dollars.
- 2.475% for a positive balance greater or equal than `5000` dollars.

You have three tasks, each of which will deal the balance and its interest rate.

## 1. Calculate the interest rate

Implement the `SavingsAccount.interest_rate` method to calculate the interest rate based on the specified balance:

```ruby
SavingsAccount.interest_rate(200.75)
#=> 0.5
```

Note that the value returned is an instance of `Float`.

## 2. Calculate the annual balance update

Implement the `SavingsAccount.annual_balance_update` method to calculate the annual balance update, taking into account the interest rate:

```ruby
SavingsAccount.annual_balance_update(200.75)
#=> 201.75375
```

Note that the value returned is an instance of `Float`.

## 3. Calculate the years before reaching the desired balance

Implement the `SavingsAccount.years_before_desired_balance` method to calculate the minimum number of years required to reach the desired balance:

```ruby
SavingsAccount.years_before_desired_balance(200.75, 214.88)
#=> 14
```

Note that the value returned is an instance of `Integer`.
