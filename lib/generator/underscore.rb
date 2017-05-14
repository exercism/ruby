module Generator
  module Underscore
    refine String do
      def underscore
        downcase.gsub(/[- ]/, '_').gsub(/[^\w?]/, '')
      end

      def camel_case
        underscore.split('_').map(&:capitalize).join
      end
    end
  end
end
