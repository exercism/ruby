require 'minitest/autorun'
# You can use this to disable all skips in the current exercise by issuing the
# following command:
#     ruby -I../lib -rdisable_skip <filename_test.rb>

module Minitest
  class Test
    def skip(*); end
  end
end
