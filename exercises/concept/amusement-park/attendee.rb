class Attendee
  def initialize(height)
    raise NotImplementedError, 'Implement the Attendee#initialize method'
  end

  def height
    raise NotImplementedError, 'Implement the Attendee#height method'
  end

  def pass_id
    raise NotImplementedError, 'Implement the Attendee#pass_id method'
  end

  def issue_pass!(pass_id)
    raise NotImplementedError, 'Implement the Attendee#issue_pass! method'
  end

  def revoke_pass!
    raise NotImplementedError, 'Implement the Attendee#revoke_pass! method'
  end
end
