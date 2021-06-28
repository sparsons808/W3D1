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
        self.my_each do |ele|
            if block.call(ele) == true
                return true
            end
        end
        false
    end

    def my_all?(&block)
        self.my_each do |ele|
            if !block.call(ele)
                return false
            end
        end
        true
    end
    # require 'byebug'    
    def my_flatten
        # debugger
        # return [self] unless self.is_a?(Array)
        # debugger
        flattened = []
        # debugger
        self.each do |ele|
            if ele.is_a?(Array)
            # debugger
                flattened += ele.my_flatten
            # debugger
            else
                flattened << ele
            end
        end
        # debugger
        flattened
    end

end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]