module BookKeeping
  VERSION = 1
end

class Tournament
  def self.tally(input)
    teams = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = 0 } }

    input.split("\n").each do |line|
      team_one, team_two, result = line.split(';')

      case result
      when "win"
        teams[team_one][:won] += 1
        teams[team_two][:loss] += 1
      when "loss"
        teams[team_one][:loss] += 1
        teams[team_two][:won] += 1
      when "draw"
        teams[team_one][:draw] += 1
        teams[team_two][:draw] += 1
      end
    end

    teams.keys.each do |team_name|
      team = teams[team_name]
      team[:matches] = team[:won] + team[:loss] + team[:draw]
      team[:points] = team[:won] * 3 + team[:draw]
    end

    team_order =
      teams
      .to_a
      .sort_by { |team| [-team[1][:points], team[0]] }
      .map(&:first)

    result = ['Team                           | MP |  W |  D |  L |  P']

    team_order.each do |team_name|
      stats = teams[team_name]

      result << [
        team_name.ljust(30),
        stats[:matches],
        stats[:won],
        stats[:draw],
        stats[:loss],
        stats[:points]
      ].join(' |  ')
    end

    result.join("\n") + "\n"
  end
end
