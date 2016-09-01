class Dominoes
  require_relative 'domino'

  def make_dominoes(list)
  end



  # ([[x,y], [a,b], ...]) => Bool
  def can_chain?(list)
    result = false
    
    return true if list.length.zero? # empty list
    return (list[0][0] == list[0][1]) if list.length == 1 #singletons

    result
  end


end