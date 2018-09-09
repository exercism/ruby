require 'generator/exercise_case'

class BookStoreCase < Generator::ExerciseCase
  def workload
    [
      "basket = #{basket}\n",
      "assert_equal #{"%.2f" % (expected/100.0)}, BookStore.calculate_price(basket)\n"
    ].join
  end
end
