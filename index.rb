require_relative('validators')
require_relative('atm_view')

system("clear")
atm_view = AtmView.new

def welcome_and_input(atm_view)
# todo - seperate welcome messages for unit testing
    atm_view.show_options
    
    input = gets.chomp
    input_valid = Validators.validate_input(input)
    if !input_valid
        # print error message for invalid input
        # and reprint welcome 
        puts "Invalid input, please enter a number from 1-4"
        puts "Press any key to continue"
        gets 
        welcome_and_input()
    end

    case input.to_i
    when 1
        balance = File.read('balance.txt')
        puts "balance: $#{balance}"

    when 2
        show_balance()

    when 3
        #show eposit
        def deposit()
        end

    when 4
        #exit
        puts "Goodbye" 
        exit(0)  #redundant to above code but just to make sure that                 
    end    
    welcome_and_input(atm_view)
end

atm_view = AtmView.new
welcome_and_input(atm_view)