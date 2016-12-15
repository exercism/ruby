#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'ostruct'

class Generator
  METADATA_REPOSITORY = 'x-common'.freeze

  attr_reader :name, :cases
  def initialize(name, cases, metadata_repository_path=nil)
    @name = name
    @cases = cases
    @metadata_repository_path = metadata_repository_path || default_metadata_path
  end

  def default_metadata_path
    File.join( '..', METADATA_REPOSITORY)
  end

  def metadata_dir
    File.join(@metadata_repository_path, 'exercises', name)
  end

  def exercise_dir
    File.join('exercises', name)
  end

  def exercise_meta_dir
    File.join(exercise_dir,'.meta')
  end

  def version_filename
    File.join(exercise_meta_dir,'.version')
  end

  def data
    File.read(File.join(metadata_dir, 'canonical-data.json'))
  end

  def path_to(file)
    File.join(exercise_dir,file)
  end

  def version
    @version ||= File.read(version_filename).strip.to_i
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
      template = File.read(path_to('example.tt'))
      f.write ERB.new(template, nil, '<>').result binding
    end
  end

  def increment_version
    File.open(version_filename, 'w') do |f|
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
