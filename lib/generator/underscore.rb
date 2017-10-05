module Generator
  module Underscore
    refine String do
      def underscore
        strip.downcase.gsub(/[- ]/, '_').gsub(/[^\w?]/, '')
      end

      def camel_case
        underscore.split('_').map(&:capitalize).join
      end
    end

    refine Integer do
      def underscore
        self.to_s.reverse.gsub(/...(?=.)/, '\&_').reverse
      end
    end
  end
end
