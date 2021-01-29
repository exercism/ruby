require 'generator/exercise_case'

class AcronymCase < Generator::ExerciseCase
  def workload
    assert_equal(expected,  "Acronym.abbreviate('#{phrase}')")
  end

  def to_s(*args)
    super unless excluded_tests.include?(test_name)
  end

  private

  # We exclude these tests because they currently don't fit the purpose
  # we have for Acronym on the Ruby track.
  def excluded_tests
    %w(
      test_apostrophes
      test_underscore_emphasis
    )
  end
end
