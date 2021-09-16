class Attendee
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

  # rubocop:disable Naming/PredicateName
  def has_pass?
    raise 'Please implement the Attendee#haspass? method'
  end
  # rubocop:enable Naming/PredicateName

  def fits_ride?(ride_minimum_height)
    raise 'Please implement the Attendee#fits_ride? method'
  end

  def allowed_to_ride?(ride_minimum_height)
    raise 'Please implement the Attendee#allowed_to_ride? method'
  end
end
