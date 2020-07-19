class Attendee
  def initialize(height)
    raise NotImplementedError, 'Implement the initialize method'
  end

  def height
    raise NotImplementedError, 'Implement the height method'
  end

  def pass_id
    raise NotImplementedError, 'Implement the pass_id method'
  end

  def issue_pass!(pass_id)
    raise NotImplementedError, 'Implement the issue_pass! method'
  end

  def revoke_pass!
    raise NotImplementedError, 'Implement the revoke_pass! method'
  end
end
