class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    raise NotImplementedError, 'Please implement the LogLineParser#message method'
  end

  def log_level
    raise NotImplementedError, 'Please implement the LogLineParser#log_level method'
  end

  def reformat
    raise NotImplementedError, 'Please implement the LogLineParser#reformat method'
  end
end
