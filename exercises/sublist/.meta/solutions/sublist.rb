module BookKeeping
  VERSION = 1
end

class Sublist

  EQUAL = 'equal'
  UNEQUAL = 'unequal'
  SUBLIST = 'sublist'
  SUPERLIST = 'superlist'

  def self.compare(list1, list2)
    comp = lambda {|l1, l2| (l1.empty?) || (l2.each_cons(l1.size).include? (l1))}
    if list1 == list2
      EQUAL
    elsif comp.call(list1, list2)
      SUBLIST
    elsif comp.call(list2, list1)
      SUPERLIST
    else
      UNEQUAL
    end
  end
end
