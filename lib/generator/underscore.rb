module Generator
  module Underscore
    refine String do
      def underscore
        downcase.gsub(/[- ]/, '_').gsub(/[^\w?]/, '')
      end
    end

    refine Fixnum do
      def underscore
        self.to_s.reverse.gsub(/...(?=.)/, '\&_').reverse
      end
    end
  end
end
