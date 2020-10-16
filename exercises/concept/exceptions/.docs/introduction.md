Exceptions in Ruby, as in many languages, provide a way of dealing with unexpected events. Proper handling of exceptions is important when trying to prevent your program from crashing.

When an exception is raised, either by raising it explicitly or by the Ruby interpreter raising it, the program diverts normal operation and eventually exits with an error message:

```ruby
raise ArgumentError.new("Something went wrong!")
=> Traceback (most recent call last):
.
.
ArgumentError (Something went wrong!)
```

```ruby
1/0
=> Traceback (most recent call last):
.
.
ZeroDivisionError (divided by 0)
```

In case we want to stop this shut down process we need to react to the exception. This is called "rescuing" an exception:

```ruby
begin
  # ...any code that raises an exception
rescue
  puts 'Got an exception'
end
```

This program will not crash and it'll output "Got an exception". Instead of exiting, Ruby runs the code in the rescue block, which prints out a message.

As everything in Ruby, exceptions are also objects and they usually hold data about the exception. This is how we can get the exception object:

```ruby
begin
  # ...any code that raises an exception
rescue => e
  puts "Exception class: #{ e.class.name }"
  puts "Exception Message:#{e.message}"
end
```

In Ruby it's also possible to raise your own exceptions. For example:

```ruby
begin
  raise ArgumentError.new("Invalid argument")
rescue ArgumentError => e
  puts e.message
end
```

The previous exception is one of the Ruby's built in exceptions but it's also possible to define custom exceptions and raise them:

```ruby
class CustomError < StandardError
end

raise CustomError.new("Something went wrong")
```

These custom errors are subclasses of the `StandardError` class. Because custom errors are also a class, it's possible to add methods to it like in any other class.

```ruby
class CustomError < StandardError
  attr_reader :action

  def initialize(message, action)
    # Call the parent's constructor to set the message
    super(message)

    @action = action
  end
end

raise CustomError.new("Something went wrong", :send_notification)
```

