# Instructions append

The exercise requires you to write a class that provides a single method for each child in the kindergarten, respectively.
You can make your work easier and less repetitive if, instead of manually defining 12 different methods, you use a bit of metaprogramming.
Your solution could use the method `#define_method` (or `#define_singleton_method`), or alternatively a combination of `#method_missing` and `#respond_to_missing?`.
