require 'minitest/autorun'
# You can use this to disabe all skips in the current exercise by issuing the
# following command:
#     ruby -I../lib -rdisable_skip <fiename_test.rb>

class Minitest
  class Test
    def skip
    end
  end
end
