require 'minitest/autorun'
require_relative 'attendee'

class AttendeeTest < Minitest::Test
  # Tests carried over from `instance-variables` exercise

  def test_new_instance
    height = 100
    assert_equal Attendee, Attendee.new(height).class
  end

  def test_new_instance_height
    height = 100
    assert_equal height, Attendee.new(height).height
  end

  def test_new_instance_pass_id
    height = 100
    assert_nil Attendee.new(height).pass_id
  end

  def test_issue_pass
    height = 100
    attendee = Attendee.new(height)

    pass_id = 1
    attendee.issue_pass!(pass_id)

    assert_equal pass_id, attendee.pass_id
  end

  def test_pass_after_revoked
    height = 100
    attendee = Attendee.new(height)
    pass_id = 1
    attendee.issue_pass!(pass_id)
    attendee.revoke_pass!
    refute attendee.pass_id
  end

  # New tests for `booleans` exercise

  def test_new_instance_doesnt_have_pass
    refute Attendee.new(100).pass?
  end

  def test_when_issued_pass
    attendee = Attendee.new(100)
    attendee.issue_pass!(1)
    assert attendee.pass?
  end

  def test_when_revoked_doesnt_have_pass
    attendee = Attendee.new(100)
    attendee.issue_pass!(1)
    attendee.revoke_pass!
    refute attendee.pass?
  end

  def test_fits_ride_exactly
    assert Attendee.new(100).fits_ride?(100)
  end

  def test_fits_small_ride
    assert Attendee.new(100).fits_ride?(80)
  end

  def test_doesnt_fit_big_ride
    refute Attendee.new(100).fits_ride?(110)
  end

  def test_fits_ride_but_no_pass
    refute Attendee.new(100).allowed_to_ride?(100)
  end

  def test_fits_ride_and_pass
    attendee = Attendee.new(100)
    attendee.issue_pass!(1)
    assert attendee.allowed_to_ride?(100)
  end
end
