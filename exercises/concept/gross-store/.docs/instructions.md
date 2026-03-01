# Instructions

A friend of yours has an old wholesale store called **Gross Store**.
The name comes from the quantity of the item that the store sell: it's all in [gross unit][gross-unit].
Your friend asked you to implement a point of sale (POS) system for his store.
**First, you want to build a prototype for it.**
**In your prototype, your system will only record the quantity.**
Your friend gave you a list of measurements to help you:

| Unit               | Score |
| ------------------ | ----- |
| quarter_of_a_dozen | 3     |
| half_of_a_dozen    | 6     |
| dozen              | 12    |
| small_gross        | 120   |
| gross              | 144   |
| great_gross        | 1728  |

## 1. Create a new customer bill

You need to implement a method that create a new (empty) bill for the customer.
This should be done in the constructor of the `GrossStore` class.

```ruby
gross_store = GrossStore.new()
gross_store.bill
# => {}
```

## 2. Add an item to the customer bill

To implement this, you'll need to:

- Return "false" if the given `unit` is not in the `UNITS` hash.
- Otherwise add the item to the customer `bill`, indexed by the item name, then return "true".
- If the item is already present in the bill, increase its quantity by the amount that belongs to the provided `unit`.

Implement the `add_item?` method, which takes two parameters: `item` (String) and `unit` (String).

```ruby
gross_store = GrossStore.new()
gross_store.add_item?("apple", "dozen")
# => true (since dozen is a valid unit)
gross_store.bill
# => {"apple" => 12}
```

## 3. Remove an item from the customer bill

To implement this, you'll need to:

- Return "false" if the given item is **not** in the bill
- Return "false" if the given `unit` is not in the `UNITS` hash.
- Return "false" if the new quantity would be less than 0.
- If the new quantity is 0, completely remove the item from the `bill` then return "true".
- Otherwise, reduce the quantity of the item and return "true".

Implement the `remove_item?` method, which takes two parameters: `item` (String) and `unit` (String).

```ruby
gross_store = GrossStore.new()
gross_store.add_item?("apple", "dozen")
gross_store.remove_item?("apple", "dozen")
# => true
gross_store.bill
# => {}
```

## 4. Return the quantity of a specific item that is in the customer bill

To implement this, you'll need to:

- Return `0` if the `item` is not in the bill.
- Otherwise, return the quantity of the item in the `bill`.

Implement the `quantity` method, which takes one parameter: `item` (String).

```ruby
gross_store = GrossStore.new()
gross_store.add_item?("apple", "dozen")
gross_store.add_item?("carrot", "half_of_a_dozen")
gross_store.quantity("apple")
# => 18
gross_store.quantity("banana")
# => 0
```

[gross-unit]: https://en.wikipedia.org/wiki/Gross_(unit)
