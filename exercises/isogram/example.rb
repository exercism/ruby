class Isogram

  def self.is_isogram?(word)

    word = word.gsub(' ','') #remove spaces
    word = word.gsub('-','') #remove hyphens
    #OR USE REGEX: word.gsub!(/ |-/,'')

    unique = word.downcase.split("").uniq

    unique.size == word.size
  end

end
