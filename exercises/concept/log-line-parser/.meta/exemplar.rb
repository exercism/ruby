# frozen_string_literal: true

module LogLineParser
  def self.message(line)
    line.slice(line.index(':') + 1, line.size).strip
  end

  def self.log_level(line)
    line.slice(1, line.index(']') - 1).downcase
  end

  def self.reformat(line)
    "#{self.message(line)} (#{self.log_level(line)})"
  end
end
