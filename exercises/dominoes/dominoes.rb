class Dominoes
  require_relative 'domino'
  attr_accessor :list

  #[ArrayTuples] => [Domino]
  def initialize(arr_form_of_dominoes =[])
    @list = []
    if !arr_form_of_dominoes.empty?
      arr_form_of_dominoes.each do |item|
        @list << Domino.new(item[0], item[1])
      end
    end
  end


  # [Domino] => Bool
  def can_chain?
    result = false
    
    return true if list.length.zero? # empty list
    return (list.first.double?) if list.length == 1 #singletons

    result
  end

  def first
    @list[0]
  end

  # # [ArrayTuples] => Bool
  # def can_chain_list?(arr_form_of_dominoes)
  #   result = false
    
  #   return true if arr_list.length.zero? # empty list
  #   return (arr_list[0][0] == arr_list[0][1]) if arr_list.length == 1 #singletons

  #   result
  # end

  

  # def self.make_dominoes!(arr_form_of_dominoes =[])
  #   @list = []
  #   if !arr_form_of_dominoes.empty?
  #     arr_form_of_dominoes.each do |item|
  #       @list << Domino.new(item[0], item[1])
  #     end
  #   end
  # end
  
end