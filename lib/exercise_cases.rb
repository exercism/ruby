require 'ostruct'
require 'json'

class ExerciseCase < OpenStruct
  def name
    'test_%s' % description.gsub(/[^\w ?!]/, '').gsub(/[- ]/, '_')
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  protected

  def raises_error?
    expected.to_i == -1
  end

  def assert_or_refute
    expected ? 'assert' : 'refute'
  end

  def assert_equal
    "assert_equal #{expected.inspect}, #{yield}"
  end

  def assert_raises(error)
    "assert_raises(#{error}) { #{yield} }"
  end
end
