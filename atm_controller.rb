require_relative('validators')

class AtmController
    def initalize(atm_view)
        @atm_view = atm_view
    end
    def run
        #welcome loop
        
        # todo - seperate welcome messages for unit testing
        @atm_view.show_options
    
        input = gets.chomp
        input_valid = Validators.validate_input(input)
        if !input_valid
            # print error message for invalid input
            # and reprint welcome 
            puts "Invalid input, please enter a number from 1-4"
            puts "Press any key to continue"
            gets 
            welcome_and_input(atm_view)
        end   
        
        case input.to_i
        when 1
            balance = File.read('balance.txt')
            puts "balance: $#{balance}"
    
        when 2
            make_withdrawl()
    
        when 3
            #show deposit
            make_deposit()
            
    
        when 4
            #exit
            puts "Goodbye" 
            exit(0)  #redundant to above code but just to make sure that                 
        end    
        run(atm_view)
    end


    def show_balance
        balance = @atm_view.get_balance()
        puts "balance: $#{balance}"
    end
    
    def get_balance
        balance = File.read('balance.txt')
    end
    
    
    def make_withdrawl
        puts "how much?"
        amount = gets.chomp # get amount from the user
        
        valid = Validators.validate_withdrawl(amount) #validate the input
            if !valid
                puts "invalid amount, please enter a positive number" #print out error message
                make_withdrawl()
            end
    
            balance = @atm_view.get_balance()
            valid = Validators.validate_amount_against_balance(amount, balance) 
            if !valid  # check the balance > amount  
                puts "Your withdrawl is greater than your balance" 
                make_withdrawl()
            end
            update_amount = (balance.to_i - amount.to_i).to_s # make the withdrawl, calculate in integer and make it a string 
            File.write('balance.txt',update_amount) #the second argument needs to be a string (that's why it was changed to string above)
            puts "Your new balance is #{update_amount}" # print new bank balance
               
        
    end
    
    def make_deposit
        puts "how much to deposit?"
    
        amount = gets.chomp
        valid = Validators.validate_withdrawl(amount)
        if !valid
            puts "Invalid amount, please enter a positive number"
            make_deposit()
        end  
        balance = @atm_view.get_balance()
        new_amount = (balance.to_i + amount.to_i).to_s
        File.write('balance.txt', new_amount)
        puts "Your new amount is #{new_amount}"
    end




end
