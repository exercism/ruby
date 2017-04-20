class Sublist
  SUBLIST = 0
  SUPERLIST = 1
  EQUAL = 2
  UNEQUAL = 3

  def check_lists(list_1, list_2)
    if list_1 == list_2
      return EQUAL
    elsif contains(list_1,list_2)
      return SUPERLIST
    elsif contains(list_2, list_1)
      return SUBLIST
    else
      return UNEQUAL
    end
  end

  def contains(l1, l2)
    if l2.empty? 
      true
    elsif l2.length > l1.length
      false
    else
      final_array = []
      x = 0
      while x < ((l1.length - l2.length) +1)
        if l1[x] == l2[0]
          j = 0
          while j < l2.length
            if l1[x+j] == l2[j]
              final_array << l1[x+j]
              if final_array == l2
                return true
                break
              end
            end
            j+= 1
          end
        end
        final_array = []
        x += 1
      end
    end
    false
  end
