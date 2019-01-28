class WordProblem
  attr_reader :question
  def initialize(question)
    @question = question
  end

  def answer
    if too_complicated?
      fail ArgumentError.new("I don't understand the question")
    end

    unless @answer
      @answer = matches[1].to_i
      matches[2..-1].compact.each_slice(2) do |op, number|
        @answer = @answer.public_send(operation(op), number.to_i)
      end
    end

    @answer
  end

  private

  def too_complicated?
    matches.nil?
  end

  def matches
    @matches ||= question.match(pattern)
  end

  def pattern
    operations = '(plus|minus|multiplied by|divided by)'
    /What is (-?\d+)(?: #{operations} (-?\d+))?(?: #{operations} (-?\d+))?\?/
  end

  def operation(op)
    case op
    when 'plus' then :+
    when 'minus' then :-
    when 'multiplied by' then :*
    when 'divided by' then :/
    end
  end
end
