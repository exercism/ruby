class Dominoes

  # ([[x,y], [a,b], ...]) => Bool
  def can_chain?(dominoes_list)
    result = false
    
    return true if dominoes_list.length.zero? # empty list
    return (dominoes_list[0][0] == dominoes_list[0][1]) if dominoes_list.length == 1 #singletons

    result
  end
end