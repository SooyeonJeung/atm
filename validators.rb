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

    #Validate our withdrawl amount. Check:
    # positive integer
    # less than or equal to current balance
    def self.validate_withdrawl(input)
        num = input.to_i
        if num > 0 
            return true 
        else
            reutrn false
        end
    end

    def self.validate_amount_against_balance(withdrawl_amount, balance)
        if withdrawl_amount.to_i > balance.to_i
            return false
        else
            return true
        end
    end
end


