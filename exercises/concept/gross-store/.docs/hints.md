# Hints

## General

- The needed methods for working with Hashes are covered in the [Ruby docs about Hashes][hash]

## 1. Create a new bill

- To create a new bill, you need to reinitialize the customer, see [Ruby docs about Hash new][hash-new]

## 2. Add item to the customer bill

- To check whether the given unit of measurement is correct, you can test your measurement map for a key without retrieving a value, you can use the [`include?`][include?] method, see [Ruby docs about Hash include?][include?]

## 3. Remove item from the customer bill

- To check whether the given item is in customer bill, you can test your measurement map for a key without retrieving a value, you can use the [`include?`][include?] method, see [Ruby docs about Hash include?][include?]
- To check whether the given unit of measurement is correct, you can test your measurement map for a key without retrieving a value, you can use the [`include?`][include?] method, see [Ruby docs about Hash include?][include?]

## 4. Return the number of specific item that is in the customer bill

- To check whether the given item is in customer bill, you can test your measurement map for a key without retrieving a value, you can use the [`include?`][include?] method, see [Ruby docs about Hash include?][include?]
[include?]: https://docs.ruby-lang.org/en/master/Hash.html#method-i-include-3F
[hash-new]: https://docs.ruby-lang.org/en/master/Hash.html#class-Hash-label-Creating+a+Hash
[hash]: https://docs.ruby-lang.org/en/master/Hash.html