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
    !pass_id.nil?
  end

  def fits_ride?(ride_minimum_height)
    height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    pass_id && fits_ride?(ride_minimum_height)
  end
end
