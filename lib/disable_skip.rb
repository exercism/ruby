require 'minitest/autorun'
# You can use this to disabe all skips in the current exercise by issuing the
# following command:
#     ruby -I../lib -rdisable_skip <fiename_test.rb>

module Minitest
  class Test
    def skip(_msg = '', _bt = caller)
    end
  end
end
