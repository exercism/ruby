

require 'byebug'

def sublist(set_a, set_b)

  return "Equal" if set_a == set_b

  (0...set_b.length).each do |first_i|
    ((first_i + 1)...set_b.length).each do |last_i|
       return "A is a subset B" if set_a == set_b[first_i..last_i]
     end
   end

   (0...set_a.length).each do |first_i|
     ((first_i + 1)...set_a.length).each do |last_i|
        return "B is a subset A" if set_b == set_a[first_i..last_i]
      end
    end

    "There are no subsets"
end

a = [2, 3, 4]
b = [1, 2, 3, 4, 5]
debugger
sublist(a,b)
# a = [1, 2, 3], b = [1, 2, 3, 4, 5], a is a sublist of b
# a = [3, 4, 5], b = [1, 2, 3, 4, 5], a is a sublist of b
# a = [3, 4], b = [1, 2, 3, 4, 5], a is a sublist of b
# a = [1, 2, 3], b = [1, 2, 3], a is equal to b
# a = [1, 2, 3, 4, 5], b = [2, 3, 4], a is a superlist of b
# a = [1, 2, 4], b = [1, 2, 3, 4, 5], a is not a superlist of, sublist of or equal to B
