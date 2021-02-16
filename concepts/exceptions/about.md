# About

It is important to note that exceptions should be used in cases where something exceptional happens, an error that needs special handling. Exceptions should not be used for control-flow of a program, as that is considered bad design, which often leads to bad performance and maintainability.

In Ruby exceptions follow a class hierarchy where `Exception` is the base class. These are the most common Ruby's built-in exceptions:

```
Exception
  NoMemoryError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SignalException
    Interrupt
  StandardError
    ArgumentError
    IOError
    EOFError
    IndexError
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RegexpError
    RuntimeError
    SecurityError
    SystemCallError
    SystemStackError
    ThreadError
    TypeError
    ZeroDivisionError
  SystemExit
```

Rescuing errors of a specific class also rescues errors of its children. This is why rescuing from `Exception` can be dangerous.
Ruby uses exceptions toalso handle messages from the operative system "Signals", for example `ctrl-c`. This means that rescuing from `Exception` will also capture this system "Signals". So in order to prevent unexpected behaviours the common practice to capture "all errors" is to rescue form `StandardError`.

Ruby also provide extended rescue clauses for situations that require an special treatment:

```ruby
begin
...
rescue CustomError => error
  # This block is run if a CustomError occurs
rescue AnotherCustomError => error
  # This block is run if a AnotherCustomError occurs
else
  # This block is run if no exception occurred at all
ensure
  # This block always run, regardless of whether an exception occurred
end
```

This can be useful for example when working with network IO where we always need to remember to close a connection.

Ruby rescue blocks can also use the `retry` keyword which re-runs everything between begin and rescue:

```ruby
counter = 0
begin
  counter += 1
  api_request
rescue
  retry if counter <= 3
end
```
