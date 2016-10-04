#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'ostruct'

class Generator
  METADATA_REPOSITORY = 'x-common'.freeze

  attr_reader :name, :cases
  def initialize(name, cases)
    @name = name
    @cases = cases
  end

  def metadata_dir
    File.expand_path(File.join('..', '..', '..', METADATA_REPOSITORY, 'exercises', name), __FILE__)
  end

  def data
    File.read(File.join(metadata_dir, 'canonical-data.json'))
  end

  def path_to(file)
    File.expand_path(File.join('..', '..', 'exercises', name, file), __FILE__)
  end

  def version
    @version ||= File.read(path_to('.version')).strip.to_i
  end

  def sha1
    `cd #{metadata_dir} && git log -1 --pretty=format:"%h"`
  end

  def test_cases
    cases.call(data)
  end

  def metadata_repository_missing_message
    <<-EOM.gsub(/^ {6}/, '')

      '#{METADATA_REPOSITORY}' repository not found.
      Try running the command:
        git clone https://github.com/exercism/#{METADATA_REPOSITORY}.git "#{metadata_dir}"

    EOM
  end

  def generate
    check_metadata_repository_exists
    generate_test_file
    increment_version
    increment_version_in_example
  end

  def check_metadata_repository_exists
    unless File.directory?(metadata_dir)
      STDERR.puts metadata_repository_missing_message
      fail Errno::ENOENT.new(metadata_dir)
    end
  end

  def generate_test_file
    File.open(path_to("#{name.gsub(/[ -]/, '_')}_test.rb"), 'w') do |f|
      f.write ERB.new(File.read(path_to('example.tt'))).result binding
    end
  end

  def increment_version
    File.open(path_to('.version'), 'w') do |f|
      f.write version + 1
    end
  end

  def increment_version_in_example
    contents = File.read(path_to('example.rb'))
    File.open(path_to('example.rb'), 'w') do |f|
      f.write contents.gsub("VERSION = #{version}", "VERSION = #{version + 1}")
    end
  end
end
