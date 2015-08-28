@players = [
  {
    player: 1,
    name: "",
    lives: 3,
    score: 0,
    turn: true
    },
  {
    player: 2,
    name: "",
    lives: 3,
    score: 0,
    turn: false
  }
]

@player1_hash = @players.find { |player| player[:player] == 1}
@player2_hash = @players.find { |player| player[:player] == 2}

def get_names
  puts "Player 1, what is your name?"
  @player1_hash[:name] = gets.chomp
  puts "Player 2, what is your name?"
  @player2_hash[:name] = gets.chomp
  turn
end

def turn
  @players.each do |hash|
    if hash[:turn]
      current_player_hash = hash
      math_problem(hash[:name], current_player_hash)
    end
  end
end

def math_problem(player, current_player_hash)
  number1 = rand(1..20)
  number2 = rand(1..20)
  puts "{#{player}, what is #{number1} + #{number2}?}"
  user_input = gets.chomp.to_i
  correct_answer = number1 + number2
  if user_input == correct_answer
    current_player_hash[:score] += 1
    puts "Great job! #{player} has #{current_player_hash[:score]} point[s]."
  else
    current_player_hash[:lives] -= 1
    puts "Incorrect answer. #{player} has #{current_player_hash[:lives]} lives left."
  end
  check_continue(current_player_hash)
end

def check_continue(current_player_hash)
  if current_player_hash[:lives] != 0
    @players.each do |hash|
      hash[:turn] = !hash[:turn]
    end
    turn
  else
    @players.each do |hash|
      if hash[:lives] != 0
        winner = hash[:name] 
        puts "Game over! #{winner} wins."
      end
    end
  end
end

get_names