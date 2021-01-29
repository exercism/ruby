class RailFenceCipher
  def self.encode(message, rails)
    return message if message.empty? || rails == 1
    empty_fences = create_empty_fences_array(message, rails)
    zig_zag_array = populate_fences_array(message, rails, empty_fences)
    zig_zag_array.flatten.join
  end

  def self.decode(message, rails)
    return message if message.empty? || rails == 1
    empty = create_empty_fences_array(message, rails)
    mark_fences = populate_fences_array('X' * message.length, rails, empty)
    line_lengths = find_the_lengths_of_the_lines(message, rails)
    lines = split_the_encrypted_message_by_rows(message, line_lengths)
    result = switch_marked_cells_with_string(mark_fences, lines, empty)
    result.transpose.flatten.join
  end

  def self.create_empty_fences_array(message, rails)
    Array.new(rails) { Array.new(message.length) }
  end

  def self.populate_fences_array(message, rails, fences)
    row = 0
    row_direction = 1
    message.length.times do |column|
      fences[row][column] = message[column]
      row_direction = 1 if row == 0
      row_direction = -1 if row == (rails - 1)
      row += row_direction
    end
    fences
  end

  def self.find_the_lengths_of_the_lines(message, rails)
    line_lengths = Hash.new(0)
    row = 0
    row_direction = 1
    (0..(message.length - 1)).each do
      line_lengths[row] += 1
      row_direction = 1 if row == 0
      row_direction = -1 if row == (rails - 1)
      row += row_direction
    end
    line_lengths
  end

  def self.split_the_encrypted_message_by_rows(message, line_lengths)
    lines = []
    line_lengths.each do |_row_num, line_length|
      lines << message.slice!(0...line_length)
    end
    lines
  end

  def self.switch_marked_cells_with_string(mark_fences, lines, fences)
    mark_fences.map.with_index do |row, row_number|
      row.map.with_index do |cell, col_number|
        if cell == 'X'
          fences[row_number][col_number] = lines[row_number].slice!(0)
        end
      end
    end
  end

  private_class_method :create_empty_fences_array,
                       :populate_fences_array,
                       :find_the_lengths_of_the_lines,
                       :split_the_encrypted_message_by_rows
end
