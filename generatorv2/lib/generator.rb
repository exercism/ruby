require 'toml-rb'
require 'net/http'
require 'uri'
require 'json'
require 'erb'
require 'rubocop'
require_relative 'utils'

class Generator
  include Utils
  include NullDevice

  def initialize(exercise = nil)
    @first = true
    @exercise = exercise
  end

  def generate(result_path = "./exercises/practice/#{@exercise}/#{underscore(@exercise)}_test.rb")
    json = remote_files
    uuid = toml("./exercises/practice/#{@exercise}/.meta/tests.toml")
    additional_json(json)
    json["cases"] = remove_tests(uuid, json)
    status = proc { status }
    template = ERB.new(File.read("./exercises/practice/#{@exercise}/.meta/test_template.erb"), trim_mode: '-')

    result = template.result(binding)

    File.write(result_path, result)
    RuboCop::CLI.new.
      run(['-a', '-c', '.rubocop.yml', '-o', NullDevice.path, result_path])
  end

  def underscore(str)
    str.gsub(/[^\w\s-]/, '').gsub('  ', ' ').gsub(/[-\s]/, '_').downcase
  end

  def camel_case(str)
    str.split(/[-_]/).map(&:capitalize).join
  end

  def skip?
    if @first
      @first = false
      return "# skip"
    end
    "skip"
  end
end
