module EliudsEggs
  def self.egg_count(display_number)
    display_number.to_s(2).count('1')
  end
end
