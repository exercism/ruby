module Generator
  module Underscore
    refine String do
      def underscore
        downcase.gsub(/[- ]/, '_').gsub(/[^\w?]/, '')
      end
    end
  end
end
