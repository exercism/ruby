require 'generator/exercise_case'

class BookStoreCase < Generator::ExerciseCase

  def workload
    assert_equal { "BookStore.calculate_price(#{basket})" }
  end

end
