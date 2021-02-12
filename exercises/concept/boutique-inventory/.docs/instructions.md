# Instructions

You run an online fashion boutique. Your big annual sale is coming up, so you want to create some functionality to help you take stock of your inventory to make sure you're ready.

A single item in the inventory is represented by a hash, and the whole inventory is an array of these hashes.

```ruby
[
  {
    name: "White Shirt",
    price: 40,
    quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}
  },
  { ... }
]
```

## 1. Return a list of the names of the items in stock

Implement `BoutiqueInventory.item_names` which should return a list of the item names, ordered alphabetically.

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).item_names

#=> ["Bamboo Socks Cats", "Black Short Skirt", "Maxi Brown Dress", "Red Short Skirt"]
```

## 2. Return any items that are cheap

Implement `BoutiqueInventory.cheap` which should return any items that cost less than \$30.

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).cheap

#=> [
      {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
      {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
    ]
```

## 3. Return any items that are out of stock

Implement `BoutiqueInventory.out_of_stock` which should return any items that have no stock (where `quantity_by_size` is empty).

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).out_of_stock

#=> [{price: 50.00, name: "Red Short Skirt", quantity_by_size: {}}]
```

## 4. Return a single item's stock

Implement `BoutiqueInventory.stock_for_item(name)` to return the stock of an item by its name:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).stock_for_item("Black Short Skirt")

#=> {s: 1, xl: 4}
```

## 5. Return the total stock

Implement `BoutiqueInventory.total_stock` to calculate the total amount of items in your storeroom:

```ruby
BoutiqueInventory.new([
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]).total_stock

#=> 36
```
