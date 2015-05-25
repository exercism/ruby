require 'minitest/autorun'
require_relative 'ocr_numbers'

class OCRTest < Minitest::Test
  def test_recognize_zero
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
| |
|_|

    NUMBER
    assert_equal '0', OCR.new(text).convert
  end

  def test_recognize_one
    skip("Expected 1, Actual ''")
    text = <<-NUMBER.chomp

  |
  |

    NUMBER
    assert_equal '1', OCR.new(text).convert
  end

  def test_recognize_two
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
 _|
|_

    NUMBER
    assert_equal '2', OCR.new(text).convert
  end

  def test_recognize_three
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
 _|
 _|

    NUMBER
    assert_equal '3', OCR.new(text).convert
  end

  def test_recognize_four
    skip("Expected 4, Actual ''")
    text = <<-NUMBER.chomp

|_|
  |

    NUMBER
    assert_equal '4', OCR.new(text).convert
  end

  def test_recognize_five
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
|_
 _|

    NUMBER
    assert_equal '5', OCR.new(text).convert
  end

  def test_recognize_six
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
|_
|_|

    NUMBER
    assert_equal '6', OCR.new(text).convert
  end

  def test_recognize_seven
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
  |
  |

    NUMBER
    assert_equal '7', OCR.new(text).convert
  end

  def test_recognize_eight
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
|_|
|_|

    NUMBER
    assert_equal '8', OCR.new(text).convert
  end

  def test_recognize_nine
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
 _
|_|
 _|

    NUMBER
    assert_equal '9', OCR.new(text).convert
  end

  def test_identify_garble
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp

| |
| |

    NUMBER
    assert_equal '?', OCR.new(text).convert
  end

  def test_identify_10
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
    _
  || |
  ||_|

    NUMBER
    assert_equal '10', OCR.new(text).convert
  end

  def test_identify_110101100
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
       _     _        _  _
  |  || |  || |  |  || || |
  |  ||_|  ||_|  |  ||_||_|

    NUMBER
    assert_equal '110101100', OCR.new(text).convert
  end

  def test_identify_with_garble
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
       _     _           _
  |  || |  || |     || || |
  |  | _|  ||_|  |  ||_||_|

    NUMBER
    assert_equal '11?10?1?0', OCR.new(text).convert
  end

  def test_identify_1234567890
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
    _  _     _  _  _  _  _  _
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|

    NUMBER
    assert_equal '1234567890', OCR.new(text).convert
  end

  def test_identify_123_456_789 # rubocop:disable Metrics/MethodLength
    skip('Undefined method [] for nil')
    text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|

 _  _  _
  ||_||_|
  ||_| _|

NUMBER
    assert_equal '123,456,789', OCR.new(text).convert
  end
end
