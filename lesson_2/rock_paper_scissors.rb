loop do
  puts "Welcome to my Rock, Paper, Scissors game!"
  puts "You will play against the computer."
  puts "Please select Rock, Paper, or Scissors."

  answer_choices = ["Rock", "Paper", "Scissors"]
  computer_selection = answer_choices[rand(4)]
  again = false
  user_selection = ''

  loop do
    user_selection = gets.chomp
    if user_selection.downcase == "rock"
      break
    elsif user_selection.downcase == "scissors"
      break
    elsif user_selection.downcase == "paper"
      break
    else
      puts "Please, enter a valid selection (Rock, Paper, or Scissors"
    end
  end
  
  puts "The computer has selected #{computer_selection}."

  if user_selection.downcase == "rock" && computer_selection.downcase == "scissors"
    puts "Rock smashes scissors! You win!"
  elsif user_selection.downcase == "rock" && computer_selection.downcase == "paper"
    puts "Paper covers rock! You lose."
  elsif user_selection.downcase == "rock" && computer_selection.downcase == "rock"
    puts "You both chose rock! Tie game."
  elsif user_selection.downcase == "paper" && computer_selection.downcase == "rock"
    puts "Paper covers rock! You win!"
  elsif user_selection.downcase == "paper" && computer_selection.downcase == "scissors"
    puts "Scissors cuts paper. You lose."
  elsif user_selection.downcase == "paper" && computer_selection.downcase == "paper"
    puts "You both selected paper. Tie game."
  elsif user_selection.downcase == "scissors" && computer_selection.downcase == "paper"
    puts "Scissors cuts paper. You win!"
  elsif user_selection.downcase == "scissors" && computer_selection.downcase == "rock"
    puts "Rock smashes scissors. You lose."
  else
    puts "You both selected scissors. Tie game."
  end

  loop do      
    puts "Would you like to play again? (Yes or No)"
    play_again = gets.chomp
    if play_again.downcase == "yes"
      again = true
      break
    elsif play_again.downcase == "no"
      break
    else
      puts "Please type either 'yes' or 'no'."
    end
  end

  if again == false
    break
  end

end