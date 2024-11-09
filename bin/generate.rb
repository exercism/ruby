require 'optparse'
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
    puts "Verifying #{exercise}"
    system("ruby ./exercises/practice/#{exercise}/#{exercise}__test.rb")
  end
end

parser.on('-e', '--exercise EXERCISE', 'The exercise to generate') do |exercise|
  Generator.new(exercise).generate
end

parser.parse!
