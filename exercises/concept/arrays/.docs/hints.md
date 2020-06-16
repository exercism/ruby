### General

- The bird count per day is stored in a [instance variable][instace-variable] named `birds_per_day`.
- The bird count per day is an array that contains exactly 7 integers.

### 1. Check what the counts were last week

- As this method does _not_ depend on the current week's count, it is defined as a [`class` method][class-method].
- There are [several ways to define an array][array-definition].

### 2. Check how many birds visited yesterday

- Remember that the counts are ordered by day from oldest to most recent, with the last element representing today.
- Accessing the second last element can be done either by using its (fixed) index (remember to start counting from zero) or by calculating its index using the [array's size][array-length].

### 3. Calculate the total number of visiting birds

- It's possible to calculate the sum of a collection using the [Array#sum][array-sum] method.

### 4. Calculate the number of busy days

- Ruby also provides a method for [counting elements on a collection][array-count]

### 5. Check if there was a day with no visiting birds

- There are some methods that can be use to check the existence on an element on a colection. For example [Enumerable#any?][enumerable-any] and [Enumerable#all?][enumerable-all]

[instance-variables]: http://ruby-for-beginners.rubymonstas.org/writing_classes/instance_variables.html
[class-method]: http://www.rubyfleebie.com/2007/04/09/understanding-class-methods-in-ruby/
[array-definition]: https://ruby-doc.org/core-2.7.0/Array.html#class-Array-label-Creating+Arrays
[array-length]: https://ruby-doc.org/core-2.7.0/Array.html#class-Array-label-Obtaining+Information+about+an+Array
[array-sum]: https://ruby-doc.org/core-2.7.0/Array.html#method-i-sum
[array-count]: https://ruby-doc.org/core-2.7.0/Array.html#method-i-count
[enumerable-any]: https://ruby-doc.org/core-2.7.0/Enumerable.html#method-i-any-3F
[enumerable-all]: https://ruby-doc.org/core-2.7.0/Enumerable.html#method-i-all-3F
