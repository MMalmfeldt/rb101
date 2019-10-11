
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def valid_number?(numb)
	numb.to_i != 0 || numb != '0'
end

def prompt(message)
	puts "=> #{message}"
end


number_1 = ''
number_2 = ''

loop do
	loop do 
		prompt(MESSAGES['enter_one'])
			number_1 = gets.chomp
			if valid_number?(number_1) == true
				break
			else
				prompt(MESSAGES['valid_numb'])
			end
	end
	loop do 
		prompt(MESSAGES['enter_two'])
			number_2 = gets.chomp
			if valid_number?(number_2) == true
				break
			else
				prompt("That doesn't look like a valid number. Try again:")
			end
	end
	prompt "Now enter the operation to be performed"

	oper = ''

	loop do 
		oper = gets.chomp
		if ['multiplication', 'addition', 'subtraction',  'division'].include?(oper)
			break
		else
			prompt <<-MSG ("Please select either: 
				multiplication, addition, subtraction, or division.") MSG
		end
	end

	def calculator(num1, num2, operation)
		
			if operation.downcase == "multiplication"
				mult_answer = num1.to_i * num2.to_i
				prompt "Multiplying .... The correct answer is #{mult_answer}."
			elsif operation.downcase == "division"
				div_answer = num1.to_f / num2.to_f
				prompt "Dividing ... The correct answer is #{div_answer}."
			elsif operation.downcase == "addition"
				add_answer = num1.to_i + num2.to_i
				prompt "Adding ... The correct answer is #{add_answer}."
			elsif operation.downcase == "subtraction"
				sub_answer = num1.to_i - num2.to_i
				prompt "Subtracting ... The correct answer is #{sub_answer}."
			else
			puts "I think you may have misunderstood."
			end
	end
	calculator(number_1, number_2, oper)
		prompt("Would you like to try again?")
		go_again = gets.chomp
		if go_again == 'n'
			break	
		else
			prompt('Okay...')
		end
end
			