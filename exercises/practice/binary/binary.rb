module Binary
    def self.to_decimal(number_decimal)
        begin
            eval("BASE = 2")
            number = number_decimal.to_i
            binary = []
            
            while number > BASE
                number /= BASE
                rest = number % BASE
                binary << rest
            end

            return self.reversed(binary)
        rescue ArgumentError => error
            puts error
        end
    end
    
    private
    def self.reversed(arr)
        new_arr = []
        left = 0
        rigth = (arr.length - 1)

        (arr.length - 1).times do
            if arr.member?(arr[left]) && arr.member?(arr[rigth])
                new_arr[left] = arr.delete_at[rigth]
                new_arr[rigth] = arr.delete_at[left]

                left += 1
                rigth -= 1
            end
        end

        return self.conc(new_arr)
    end

    def self.conc(arr)
        return arr.length if arr.length <= 1        
        return arr.reduce(:+)
    end
end