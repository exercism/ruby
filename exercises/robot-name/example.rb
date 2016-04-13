class Robot
  VERSION = 1

  @taken_names = {}

  def name
    @name ||= generate_name
  end

  def reset
    @name = nil
  end

  def self.taken_names
    @taken_names
  end

  private

  def generate_name
    name = "#{prefix}#{suffix}"
    if self.class.taken_names[name]
      generate_name
    else
      self.class.taken_names[name] = true
      name
    end
  end

  def prefix
    alphabet.sample(2).join('')
  end

  def suffix
    rand(100...999)
  end

  def alphabet
    ('A'..'Z').to_a
  end
end
