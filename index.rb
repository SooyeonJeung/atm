def hello
    return "hello world"
end

puts "hello world"

def welcome_and_input

    system("clear")
    puts "Welcome toyour friendly neighbourhood ATM"
    puts "Please select frrom the following options :"
    puts "1. Display balance"
    puts "2. Make a withdrawl"
    puts "3. Make a deposit"
    puts "4. Exit"

    input = gets.chomp.to_i
    case input
    when 1
        #show balance
    when 2
        #show withdrawl
    when 3
        #show eposit
    when 4
        #exit
        puts "Goodbye" 
        system("exit")  #redundant to above code but just to make sure that 
    else
        # print error message for invalid input
        # and reprint welcome 
        puts "Invalid input, please enter a number from 1-4"
        puts "Press any key to continue"
        gets 
        welcome_and_input()
    end
     
end

welcome_and_input()