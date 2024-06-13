# Instructions Append

## Benchmarking

If you are solving this exercise locally, there is an included `parallel_letter_frequency_benchmark_test.rb` file which will compare your parallel solution to a sequential one.
You can run it via `ruby parallel_letter_frequency_benchmark_test.rb`.
The output will show execution times of each implementation over a range of large text counts in a tabular format.
Feel free to change the test cases.
You may want to investigate what performance impact length of text vs number of texts has on the execution time for each implementation.

**Note:** For smaller sets of text, the sequential count _may_ be faster due to processing overhead costs.

## Further Reading

- [Ruby `Thread` Documentation](https://docs.ruby-lang.org/en/master/Thread.html)
- [Ruby `Thread::Queue` Documentation](https://docs.ruby-lang.org/en/master/Thread/Queue.html)
- [Ruby `Fiber` Documentation](https://docs.ruby-lang.org/en/master/Fiber.html)
- [Ruby `Ractor` Documentation](https://docs.ruby-lang.org/en/master/Ractor.html)
- [`Minitest::Benchmark` Documentation](https://ruby-doc.org/3.0.6/gems/minitest/Minitest/Benchmark.html)
