class Dominoes

  # [[x,y],[a,b], ...] => Bool
  def can_chain?(dominoes_list)
    result = false

    # Base case : empty list
    return true if dominoes_list.length == 0 # empty list

    #Base case : one domino
    if ((dominoes_list.length == 1) && (dominoes_list[0][0] == dominoes_list[0][1])) #singletons
      return true
    else
      return false
    end

    result
  end
end