puts "Enter the first number to be worked with:"
	number_1 = gets.chomp
puts "Now enter the second number to be worked with:"
	number_2 = gets.chomp
puts "Now enter the operation to be performed"
	oper = gets.chomp

def calculator(num1, num2, operation)
	if operation.downcase == "multiplication"
		mult_answer = num1.to_i * num2.to_i
		puts "The correct answer is #{mult_answer}."
		
	elsif operation.downcase == "division"
		div_answer = num1.to_i / num2.to_i
		puts "The correct answer is #{div_answer}."
		
	elsif operation.downcase == "addition"
		add_answer = num1.to_i + num2.to_i
		puts "The correct answer is #{add_answer}."
		
	elsif operation.downcase == "subtraction"
		sub_answer = num1.to_i - num2.to_i
		puts "The correct answer is #{sub_answer}."
		
	else
		puts "I think you may have misunderstood."
	end
end

calculator(number_1, number_2, oper)
		
		