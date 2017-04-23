module Underscore
  refine String do
    def underscore
      downcase.gsub(/[- ]/, '_').gsub(/\W/, '')
    end
  end
end
