class Lasagna
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    raise NotImplementedError, 'Please implement the remaining_minutes_in_oven method'
  end

  def preperation_time_in_minutes(layers)
    raise NotImplementedError, 'Please implement the preperation_time_in_minutes method'
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    raise NotImplementedError, 'Please implement the total_time_in_minutes method'
  end
end
