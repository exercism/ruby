module Port
  Identifier = :PALE

  def self.get_identifier(city)
    return city[0..3].to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s[0..2]
    return cargo == "OIL" || cargo == "GAS" ? :A : :B
  end
end
