require_relative "./wordy"

RSpec.describe WordProblem do
  it "can add one to one" do
    problem = WordProblem.new("What is 1 plus 1?")

    expect(problem.answer).to eq(2)
  end

  it "can add two to fifty three" do
    skip "fix this test second - delete the `skip` lines to enable individual tests"

    problem = WordProblem.new('What is 53 plus 2?')

    expect(problem.answer).to eq(55)
  end

  it "can add negative numbers together" do
    skip "fix this test third"

    problem = WordProblem.new('What is -1 plus -10?')

    expect(problem.answer).to eq(-11)
  end

  it "can add larger numbers together" do
    skip "fix this test fourth"

    problem = WordProblem.new('What is 123 plus 45678?')

    expect(problem.answer).to eq(45_801)
  end

  it "can subtract numbers from each other" do
    skip "fix this test fifth"

    problem = WordProblem.new('What is 4 minus -12?')

    expect(problem.answer).to eq(16)
  end

  it "can multiply numbers together" do
    skip "fix this test sixth"

    problem = WordProblem.new('What is -3 multiplied by 25?')

    expect(problem.answer).to eq(-75)
  end

  it "can divide two numbers" do
    skip "fix this test seventh"

    problem = WordProblem.new('What is 33 divided by -3?')

    expect(problem.answer).to eq(-11)
  end

  it "can add numbers together multiple times" do
    skip "fix this test eight"

    question = 'What is 1 plus 1 plus 1?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(3)
  end

  it "can add and then subtract a number" do
    skip "fix this test ninth"

    question = 'What is 1 plus 5 minus -2?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(8)
  end

  it "can subtract numbers twice" do
    skip "fix this test tenth"

    question = 'What is 20 minus 4 minus 13?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(3)
  end

  it "can subtract then add a number" do
    skip "fix this test eleventh"

    question = 'What is 17 minus 6 plus 3?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(14)
  end

  it "can multiply numbers twice" do
    skip "fix this test twelth"

    question = 'What is 2 multiplied by -2 multiplied by 3?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(-12)
  end

  it "can add then multiply numbers" do
    skip "fix this test thirtheenth"

    question = 'What is -3 plus 7 multiplied by -2?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(-8)
  end

  it "can divide numbers twice" do
    skip "fix this test fourteenth"

    question = 'What is -12 divided by 2 divided by -3?'
    problem = WordProblem.new(question)

    expect(problem.answer).to eq(2)
  end

  it "can't do advanced math" do
    skip "fix this test fifteenth"

    problem = WordProblem.new('What is 53 cubed?')

    expect { problem.answer }.to raise_error(ArgumentError)
  end

  it "can't answer irrelevant questions" do
    skip "fix this test sixteenth"

    problem = WordProblem.new('Who is the president of the United States?')

    expect { problem.answer }.to raise_error(ArgumentError)
  end
end
