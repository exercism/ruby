class ResistorColorTrio
  COLOR_CODES = %i[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @tens, @ones, @zeros = @colors
  end

  def label
    "Resistor value: #{to_s}"
  end

  private

  attr_reader :tens, :ones, :zeros

  def significants
    COLOR_CODES.index(tens) * 10 + COLOR_CODES.index(ones)
  end

  def multiplier
    @multiplier ||= 10.pow(COLOR_CODES.index(zeros))
  end

  def value
    significants * multiplier
  end

  def to_s
    value < 1000 ? "#{value} ohms" : "#{(value.to_f/1000).to_i} kiloohms"
  end
end
