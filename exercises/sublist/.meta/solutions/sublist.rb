module Sublist
  def self.sublist(l1, l2)
    s1 = l1.join(',')
    s2 = l2.join(',')
    return 'equal' if s1 == s2
    return 'sublist' if s2.include? s1
    return 'superlist' if s1.include? s2
    return 'unequal'
  end
end

module BookKeeping
  VERSION = 1
end
