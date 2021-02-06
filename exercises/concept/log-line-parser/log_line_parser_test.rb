# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'log_line_parser'

class LogLineParserTest < Minitest::Test
  def test_error_message
    assert_equal 'Stack overflow', LogLineParser.message('[ERROR]: Stack overflow')
  end

  def test_warning_message
    assert_equal 'Disk almost full', LogLineParser.message('[WARNING]: Disk almost full')
  end

  def test_info_message
    assert_equal 'File moved', LogLineParser.message('[INFO]: File moved')
  end

  def test_message_with_leading_and_trailing_space
    assert_equal 'Timezone not set', LogLineParser.message("[WARNING]:   \tTimezone not set  \r\n")
  end

  def test_error_log_level
    assert_equal 'error', LogLineParser.log_level('[ERROR]: Disk full')
  end

  def test_warning_log_level
    assert_equal 'warning', LogLineParser.log_level('[WARNING]: Unsafe password')
  end

  def test_info_log_level
    assert_equal 'info', LogLineParser.log_level('[INFO]: Timezone changed')
  end

  def test_erro_reformat
    assert_equal 'Segmentation fault (error)', LogLineParser.reformat('[ERROR]: Segmentation fault')
  end

  def test_warning_reformat
    assert_equal 'Decreased performance (warning)', LogLineParser.reformat('[WARNING]: Decreased performance')
  end

  def test_info_reformat
    assert_equal 'Disk defragmented (info)', LogLineParser.reformat('[INFO]: Disk defragmented')
  end

  def rest_reformat_with_leading_and_trailing_space
    assert_equal 'Corrupt disk (error)', LogLineParser.reformat("[ERROR]: \t Corrupt disk\t \t \r\n")
  end
end
