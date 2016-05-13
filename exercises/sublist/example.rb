
def sublist(set_a, set_b)

  return 'Equal' if set_a == set_b
  return 'A is a subset' if subset(set_a, set_b)
  return 'A is a superset' if subset(set_b, set_a)

  'There are no subsets'
end

def subset(set_1, set_2)
  (0...set_2.length).each do |first_i|
    ((first_i + 1)...set_2.length).each do |last_i|
       return true if set_1 == set_2[first_i..last_i]
     end
   end
   false
 end
