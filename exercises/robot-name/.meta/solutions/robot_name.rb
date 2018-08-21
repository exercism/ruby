class Robot
  def self.forget
    @@name_enumerator = [*'AA000'..'ZZ999'].shuffle.each
  end

  self.forget

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = @@name_enumerator.next
  end
end
