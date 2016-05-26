module BookKeeping
  VERSION = 2
end

class TwoBucket
  attr_reader :goal_bucket, :other_bucket

  def initialize(first_size, second_size, goal, start_bucket)
    @first_size = first_size
    @second_size = second_size
    @goal = goal
    @start_bucket = start_bucket
  end

  def moves
    if @start_bucket == 'one'
      @levels = [@first_size, 0]
      solve method(:start_from_first)
    else
      @levels = [0, @second_size]
      solve method(:start_from_second)
    end
  end

  private

  def solve(strategy)
    moves_count = 1

    loop do
      return moves_count if solved?
      strategy.call
      moves_count += 1
    end
  end

  def solved?
    if @levels.any? { |level| level == @goal }
      if @levels.first == @goal
        @goal_bucket = 'one'
        @other_bucket = @levels.last
      else
        @goal_bucket = 'two'
        @other_bucket = @levels.first
      end

      true
    end
  end

  def start_from_first
    if first_bucket_empty?
      fill_first_bucket
    elsif second_bucket_full?
      empty_second_bucket
    elsif can_move_to_second_bucket?
      fill_second_bucket_from_first
    end
  end

  def start_from_second
    if first_bucket_full?
      empty_first_bucket
    elsif second_bucket_empty?
      fill_second_bucket
    elsif can_move_to_first_bucket?
      fill_first_bucket_from_second
    end
  end

  def first_bucket_empty?
    @levels.first == 0
  end

  def first_bucket_full?
    @levels.first == @first_size
  end

  def second_bucket_empty?
    @levels.last == 0
  end

  def second_bucket_full?
    @levels.last == @second_size
  end

  def can_move_to_second_bucket?
    (first_bucket_full? && !second_bucket_full?) ||
      (!first_bucket_full? && second_bucket_empty?)
  end

  def can_move_to_first_bucket?
    @levels.reduce(:+) != @first_size
  end

  def empty_first_bucket
    @levels[0] = 0
  end

  def fill_first_bucket
    @levels[0] = @first_size
  end

  def empty_second_bucket
    @levels[1] = 0
  end

  def fill_second_bucket
    @levels[1] = @second_size
  end

  def fill_first_bucket_from_second
    @levels = [@levels.reduce(:+), @first_size].min,
              [@levels.reduce(:+) - @first_size, 0].max
  end

  def fill_second_bucket_from_first
    @levels = [@levels.reduce(:+) - @second_size, 0].max,
              [@levels.reduce(:+), @second_size].min
  end
end
