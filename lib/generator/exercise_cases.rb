require 'ostruct'
require 'json'

class ExerciseCase < OpenStruct
  using Generator::Underscore

  def name
    'test_%s' % description.underscore
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  protected

  # used to indent multi line workloads, as
  #   indent_lines(
  #     [
  #       "string = #{input.inspect}",
  #       "#{assert} Isogram.is_isogram?(string)"
  #     ], 4
  #   )
  def indent_lines(code, depth)
    code.join("\n" + ' ' * depth)
  end

  # used in workload, for example, as
  #   "#{assert} Luhn.valid?(#{input.inspect})"
  def assert
    expected ? 'assert' : 'refute'
  end

  # used in workload, for example, as
  #   assert_equal { "PigLatin.translate(#{input.inspect})" }
  def assert_equal
    "assert_equal #{expected.inspect}, #{yield}"
  end

  # used in workload, for example, as
  #   if raises_error?
  #     assert_raises(ArgumentError) { test_case }
  #   else
  #     assert_equal { test_case }
  #   end

  def raises_error?
    expected.to_i == -1
  end

  def assert_raises(error)
    "assert_raises(#{error}) { #{yield} }"
  end
end
