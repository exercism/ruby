# frozen_string_literal: true

module LogLineParser
  def self.message(line)
    raise NotImplementedError, 'Please implement the LogLineParser.message method'
  end

  def self.log_level(line)
    raise NotImplementedError, 'Please implement the LogLineParser.log_level method'
  end

  def self.reformat(line)
    raise NotImplementedError, 'Please implement the LogLineParser.reformat method'
  end
end
