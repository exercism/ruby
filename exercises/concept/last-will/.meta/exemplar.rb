# Secret knowledge of the Zhang family:
class Zhang
  def self.bank_number_part(secret_modifier)
    zhang_part = 8541
    (zhang_part * secret_modifier) % 10000
  end
  class Red
    def self.code_fragment
      512
    end
  end
  class Blue
    def self.code_fragment
      677
    end
  end
end

# Secret knowledge of the Khan family:
class Khan
  def self.bank_number_part(secret_modifier)
    khan_part = 4142
    (khan_part * secret_modifier) % 10000
  end
  class Red
    def self.code_fragment
      148
    end
  end
  class Blue
    def self.code_fragment
      875
    end
  end
end

# Secret knowledge of the Garcia family:
class Garcia
  def self.bank_number_part(secret_modifier)
    garcia_part = 4023
    (garcia_part * secret_modifier) % 10000
  end
  class Red
    def self.code_fragment
      118
    end
  end
  class Blue
    def self.code_fragment
      923
    end
  end
end

class EstateExecutor
  def self.assemble_account_number(secret_modifier)
    Zhang::bank_number_part(secret_modifier) + Khang::bank_number_part(secret_modifier) + Garcia::bank_number_part(secret_modifier)
  end

  def self.assemble_code
    Zhang::Red::code_fragment + Khang::Red::code_fragment + Garcia::Red::code_fragment + Zhang::Blue::code_fragment + Khang::Blue::code_fragment + Garcia::Blue::code_fragment
  end
end
