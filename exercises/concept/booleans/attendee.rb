class Attendee
  attr_reader :height, :pass_id

  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Do not edit above methods, add your own methods below.

  def pass?
    raise NotImplementedError, 'Please implement the pass? method'
  end

  def fits_ride?(ride_minimum_height)
    raise NotImplementedError, 'Please implement the fits_ride? method'
  end

  def allowed_to_ride?(ride_minimum_height)
    raise NotImplementedError, 'Please implement the allowed_to_ride? method'
  end
end
