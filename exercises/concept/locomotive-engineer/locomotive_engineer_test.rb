require 'minitest/autorun'
require_relative 'locomotive_engineer'

class LocomotiveEngineerTest < Minitest::Test
  def test_get_array_of_wagons_with_a_few_inputs
    assert_equal [1, 5, 2, 7, 4], LocomotiveEngineer.generate_list_of_wagons(1, 5, 2, 7, 4)
  end

  def test_get_array_of_wagons_with_two_inputs
    assert_equal [1, 5], LocomotiveEngineer.generate_list_of_wagons(1, 5)
  end

  def test_get_array_of_wagons_with_one_inputs
    assert_equal [1], LocomotiveEngineer.generate_list_of_wagons(1)
  end

  def test_get_array_of_wagons_with_many_inputs
    assert_equal [1, 10, 6, 3, 9, 8, 4, 14, 24, 7], LocomotiveEngineer.generate_list_of_wagons(1, 10, 6, 3, 9, 8, 4, 14, 24, 7)
  end

  def test_fix_array_of_wagons_a_few_inputs
    assert_equal [1, 3, 17, 6, 15, 7, 4, 12, 6, 3, 13, 2, 5],
      LocomotiveEngineer.fix_list_of_wagons([2, 5, 1, 7, 4, 12, 6, 3, 13], [3, 17, 6, 15])
  end

  def test_fix_array_of_wagons_many_inputs
    assert_equal [1, 8, 10, 5, 9, 36, 7, 20, 14, 10, 4, 12, 6, 23, 17, 13, 22, 28, 19, 3, 27],
      LocomotiveEngineer.fix_list_of_wagons([3, 27, 1, 14, 10, 4, 12, 6, 23, 17, 13, 22, 28, 19], [8, 10, 5, 9, 36, 7, 20])
  end

  def test_fix_array_of_wagons_the_inputs_are_same_length
    assert_equal [1, 8, 6, 15, 4, 2],
      LocomotiveEngineer.fix_list_of_wagons([4, 2, 1], [8, 6, 15])
  end

  def test_fix_array_of_wagons_the_missing_wagons_input_is_longer
    assert_equal [1, 8, 6, 4, 5, 9, 21, 2, 13, 25, 7, 19, 10, 3, 14],
      LocomotiveEngineer.fix_list_of_wagons([3, 14, 1, 25, 7, 19, 10], [8, 6, 4, 5, 9, 21, 2, 13])
  end

  def test_add_missing_stops_a_few_stops
    assert_equal({ from: 'Berlin', to: 'Hamburg', stops: %w[Lepzig Hannover Frankfurt] },
      LocomotiveEngineer.add_missing_stops({ from: 'Berlin', to: 'Hamburg' }, stop_1: 'Lepzig', stop_2: 'Hannover', stop_3: 'Frankfurt'))
  end

  def test_add_missing_stops_with_one_stop
    assert_equal({ from: 'Paris', to: 'London', stops: ['Lille'] },
      LocomotiveEngineer.add_missing_stops({ from: 'Paris', to: 'London' }, stop_1: 'Lille'))
  end

  def test_add_missing_stops_with_zero_stops
    assert_equal({ from: 'New York', to: 'Philadelphia', stops: [] },
      LocomotiveEngineer.add_missing_stops({ from: 'New York', to: 'Philadelphia' }))
  end

  def test_add_missing_stops_with_many_stops
    assert_equal({ from: 'Gothenburg', to: 'Copenhagen', stops: %w[Kungsbacka Varberg Halmstad Angelholm Lund Malmo] },
      LocomotiveEngineer.add_missing_stops({ from: 'Gothenburg', to: 'Copenhagen' }, stop_1: 'Kungsbacka', stop_2: 'Varberg', stop_3: 'Halmstad', stop_4: 'Angelholm', stop_5: 'Lund', stop_6: 'Malmo'))
  end

  def test_extend_route_information_with_four_extra_inputs
    assert_equal({ from: 'Berlin', to: 'Hamburg', timeOfArrival: '12:00', precipitation: '10', temperature: '5', caboose: 'yes' },
      LocomotiveEngineer.extend_route_information({ from: 'Berlin', to: 'Hamburg' }, { timeOfArrival: '12:00', precipitation: '10', temperature: '5', caboose: 'yes' }))
  end

  def test_extend_route_information_with_three_extra_inputs
    assert_equal({ from: 'Paris', to: 'London', timeOfArrival: '10:30', temperature: '20', length: '15' },
      LocomotiveEngineer.extend_route_information({ from: 'Paris', to: 'London' }, { timeOfArrival: '10:30', temperature: '20', length: '15' }))
  end

  def test_extend_route_information_with_three_extra_inputs_with_different_information
    assert_equal({ from: 'Gothenburg', to: 'Copenhagen', precipitation: '1', timeOfArrival: '21:20', temperature: '-6' },
      LocomotiveEngineer.extend_route_information({ from: 'Gothenburg', to: 'Copenhagen' }, { precipitation: '1', timeOfArrival: '21:20', temperature: '-6' }))
  end
end
