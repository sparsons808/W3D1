class Array

    def my_each(&block)
        i = 0

        while i < self.length
            block.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&block)
        new_arr = []

        self.my_each do |ele|
            if block.call(ele) == true
                new_arr << ele
            end
        end

        new_arr

    end

    def my_reject(&block)
        new_arr = []

        self.my_each do |ele|
            if block.call(ele) == false
                new_arr << ele
            end
        end

        new_arr
    end

    def my_any?(&block)
        

    end
end



a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]