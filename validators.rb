module Validators
    def self.validate_input(input)
        # convert input the integer
        num_input = input.to_i
        if 0 < num_input && num_input < 5
        # if integer == 1..4 return true
            return true 
        else
         # else return false
            return false
        end
    end
end


