You're continuing to work on the stock management system you built previous. Since discovering `OpenStruct` and block shortcuts, you've decided to refactor the code a little. Rather than storing the items as hashes, you're going to utilize your newfound skills.

## 1. Allow retrievable of items

You want to continue to retrieve the list of items in stock, but this time they should be objects that can have methods called on them.

```ruby
inventory = BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
])

inventory.items.first.name
=> "Maxi Brown Dress"

inventory.items.first.price
=> 65

inventory.items.size
=> 4
```

# 2. Refactor `item_names` 

Refactor `item_names` to use the new block shortcut you've learnt rather than hashes.
As a reminder, the method should return:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

#=> ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```


# 2. Refactor `total_stock`

Refactor `total_stock` to use the new block shortcut you've learnt rather than hashes.
As a reminder, the method should return::

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

#=> 36
```
