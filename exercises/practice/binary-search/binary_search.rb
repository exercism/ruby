class BinarySearch
    attr_accessor :arr
    def initialize(arr)
        @arr = arr
    end

    def search_for(target)
        left = 0
        rigth = @arr.length
        
        return 0 if target == @arr[0]
        
        while left <= rigth
            middle = (left + rigth) / 2
            item = @arr[middle]

            if item == target
                return middle
            elsif item > target
                rigth = middle - 1
            else
                left = middle + 1
            end
        end

        return nil
    end
end