require 'optparse'
require 'tempfile'
require_relative '../generatorv2/lib/generator'

parser = OptionParser.new

parser.on('-v', '--version', 'Print the version') do
  puts '0.1.0'
end

parser.on('-h', '--help', 'Prints help') do
  puts parser
end

parser.on('-a', '--all', 'Generate all exercises') do
  exercises = Dir.entries('./exercises/practice').select { |f| File.directory? File.join('./exercises/practice', f) }
  exercises.each do |exercise|
    if File.exist?("./exercises/practice/#{exercise}/.meta/test_template.erb")
      Generator.new(exercise).generate
    end
  end
end

parser.on('--verify', 'Verify all exercises') do
  exercises = Dir.entries('./exercises/practice').select { |f| File.directory? File.join('./exercises/practice', f) }
  exercises.each do |exercise|
    if File.exist?("./exercises/practice/#{exercise}/.meta/test_template.erb")
      current_code = File.read("./exercises/practice/#{exercise}/#{exercise}_test.rb")
      f = Tempfile.create
      Generator.new(exercise).generate(f.path)
      generated_code = f.read
      raise RuntimeError.new("The result generated for: #{exercise}, doesnt match the current file") if current_code != generated_code
    end
  end
end

parser.on('-e', '--exercise EXERCISE', 'The exercise to generate') do |exercise|
  Generator.new(exercise).generate
end

parser.parse!
