require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
	puts "=> #{message}"
end

loan = ''
apr_rate = ''
loan_dur = ''

prompt(MESSAGES['greetings'])

# request loan amount in dollars
# validate input with loop
loop do
	loop do
		prompt(MESSAGES['loan_amount'])
		loan = gets.chomp
		if loan.to_i.to_s == loan
			break
		else
			prompt(MESSAGES['invalid_input'])
		end
	end

	# request APR in percentage points
	# validate input with loop

	loop do
		prompt(MESSAGES['apr_request'])
		apr_rate = gets.chomp
		if apr_rate.to_f.to_s == apr_rate || apr_rate.to_i.to_s == apr_rate
			break
		elsif apr_rate == '0'
			break
		else
			prompt(MESSAGES['invalid_input'])
		end
	end

	# request loan duration in years
	# validate input with loop
	loop do
		prompt(MESSAGES['loan_duration'])
		loan_dur = gets.chomp
		if loan_dur.to_i.to_s == loan_dur
		  break
		else
			prompt(MESSAGES['invalid_input'])
		end
	end

	# convert years to months
	# convert APR to monthly rate
	loan_in_months = loan_dur.to_i * 12
	apr_in_months = apr_rate.to_f / 1200

	# plug in math for computation

	monthly_payment = loan.to_i * (apr_in_months / (1 - (1 + apr_in_months)**(-loan_in_months)))
 
	puts "Your monthly payment is $#{format('%02.2f', monthly_payment)}!"
	go_again = ''

	loop do
		puts "Would you like to calculate again? (y/n)"
		go_again = gets.chomp
		if go_again == 'y' || 'n'
			break
		else
			puts "You must enter either 'y' or 'n'."
		end
	end

	if go_again == 'n'
		break
	else
		puts "Okay, let's start over..."
	end
end
