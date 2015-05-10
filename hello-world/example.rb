class HelloWorld
  def self.hello(name = '')
    name == '' ? 'Hello, world!' : "Hello, #{name}!"
  end
end
