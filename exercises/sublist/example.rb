require 'byebug'
SUBLIST = 0
SUPERLIST = 1
EQUAL = 2
UNEQUAL = 3

def check_lists(l1,l2)
  if l1 == l2
    return EQUAL
  elsif contains(l1, l2)
    return SUPERLIST
  elsif contains(l2,l1)
    return SUBLIST
  else
    UNEQUAL
  end
end

def contains(l1, l2)
  if l2.empty?
    return true
  elsif l2.length>l1.length
    return false
  end

  for i in 0..(l1.length-l2.length)
    if l1[i] != l2[0]
      next
    else
      for j in 1..(l2.length)
        if l1[i+j] != l2[j]
          break
        end
        return true
      end
    end 
  end
  return false
end
