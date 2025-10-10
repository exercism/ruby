class WordProblem
  attr_reader :question

  def initialize(question)
    @question = question
  end

  def answer
    raise ArgumentError, "I don't understand the question" if too_complicated?

    if matches[2].nil?
      @answer = n1
    else
      @answer = n1.send(operation(2), n2)
      @answer = @answer.send(operation(4), n3) if chain?
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

  def operation(index)
    case matches[index]
    when 'plus' then :+
    when 'minus' then :-
    when 'multiplied by' then :*
    when 'divided by' then :/
    end
  end

  def n1
    matches[1].to_i
  end

  def n2
    matches[3].to_i
  end

  def n3
    matches[-1].to_i
  end

  def chain?
    !!matches[4]
  end
end
