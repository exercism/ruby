$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

unless ENV['CI']
  require 'simplecov'

  CoverageGroup = Struct.new(:name, :regex)

  SimpleCov.start do
    add_filter '/test/'

    groups = [
      CoverageGroup.new('Generator', %r{lib/generator}),
      CoverageGroup.new('Tasks', %r{tasks}),
      CoverageGroup.new('Cases', %r{exercises/.*_case.rb$})
    ]

    groups.each do |group|
      add_group group.name do |file|
        file.filename.match(group.regex)
      end
    end

    add_group 'Other' do |file|
      groups.none? { |group| file.filename.match(group.regex) }
    end
  end
end

require 'minitest/autorun'
require 'mocha/minitest'

# So we can be sure we have coverage on the whole lib directory:
Dir.glob('lib/**/*.rb').each { |file| require file.gsub(%r{(^lib/|\.rb$)}, '') }
