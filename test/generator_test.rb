require_relative 'test_helper'

class GeneratorTest < Minitest::Test
  def test_initalize
    subject = Generator.new('a name', 'some cases')
    assert_instance_of Generator, subject
  end
end

