class Matrix
  attr_reader :rows, :columns
  def initialize(input)
    @rows = extract_rows(input)
    @columns = extract_columns(rows)
  end

  private

  def extract_rows(s)
    s.split.map do |row|
      row.split(' ').map(&:to_i)
    end
  end

  def extract_columns(rows)
    rows.transpose
  end
end
