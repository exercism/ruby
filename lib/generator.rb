#!/usr/bin/env ruby

require 'erb'
require 'json'
require 'ostruct'

class Generator
  attr_reader :name, :cases
  def initialize(name, cases)
    @name = name
    @cases = cases
  end

  def metadata_dir
    File.expand_path(File.join('..', '..', '..', 'x-common'), __FILE__)
  end

  def data
    File.read(File.join(metadata_dir, "#{name}.json"))
  end

  def path_to(file)
    File.expand_path(File.join('..', '..', name, file), __FILE__)
  end

  def version
    @version ||= File.read(path_to('.version')).strip.to_i
  end

  def sha1
    `cd #{metadata_dir} && git log -1 --oneline`
  end

  def test_cases
    cases.call(data)
  end

  def generate
    File.open(path_to("#{name}_test.rb"), 'w') do |f|
      f.write ERB.new(File.read(path_to('example.tt'))).result binding
    end
    File.open(path_to('.version'), 'w') do |f|
      f.write version + 1
    end
    contents = File.read(path_to('example.rb'))
    File.open(path_to('example.rb'), 'w') do |f|
      f.write contents.gsub("VERSION = #{version}", "VERSION = #{version + 1}")
    end
  end
end
