# frozen_string_literal: true

class LaunchStatusCheck
  class LaunchStatusError < StandardError
    def initalize(message = 'Launch flight team(s) have not given a go/no-go status.')
      super
    end
  end

  class AbortLaunchError < StandardError
    def initialize(message = 'Launch flight team(s) have given a no-go status.')
      super
    end
  end

  GO = :go
  NO_GO = :no_go

  def initialize(flight_teams)
    @flight_teams = flight_teams
  end

  def all_teams_checked_in(status_checks)
    @flight_teams.all? { |team| status_checks.key?(team) }
  end

  def all_teams_are_go(status_checks)
    status_checks.values.none? { |status_check| status_check == NO_GO }
  end

  def check(status_checks)
    raise LaunchStatusError, LAUNCH_STATUS_MESSAGE unless all_teams_checked_in(status_checks)
    raise AbortLaunchError, ABORT_LAUNCH_MESSAGE unless all_teams_are_go(status_checks)
  end
end
