$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'require_all'

unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/test/'
    add_group 'Generator' do |file|
      file.filename =~ /generator/
    end
    add_group 'Cases', '_cases.rb'
    add_group 'Other' do |file|
      !(file.filename =~ /_cases\.rb$/) && file.filename !~ /generator/
    end
  end
end

require 'minitest/autorun'

# So we can be sure we have coverage on the whole lib directory:
require_all 'lib'
