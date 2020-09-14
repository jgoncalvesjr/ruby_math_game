# Main game class. Welcomes players, explains rules, manages turn taking and finishes game

require './question'
require './player'
require './turn'

class Game

  def initialize
    welcome_message
    @p1 = player1
    @p2 = player2
    current_player_turn
    end_game
  end

  def welcome_message
    system "clear"
    puts "Welcome to Math hOOPs!\n"
    puts "This is a very simple game.\n"
    puts "Two players start with three lives each.\n"
    puts "Each player will take turns, answering sum or minus questions.\n"
    puts "If you give the wrong answer, you lose a life!\n"
    puts "If you lose all of your lives, you lose the game!\n"
    puts "Good luck, and have fun!\n"
    puts "--------------------------------------------------"
  end

  def player1
    puts "Player 1, what's your name?"
    print "> "
    player1_name = $stdin.gets.chomp
    p1 = Player.new(player1_name)
  end

  def player2
    puts "Player 2, what's your name?"
    print "> "
    player2_name = $stdin.gets.chomp
    p2 = Player.new(player2_name)
  end

  def current_player_turn
    current_player = @p1
    while @p1.lives > 0 && @p2.lives > 0
      Turn.new(current_player)
      puts "-------- SCORES --------"
      puts "#{@p1.name}: #{@p1.lives}/3 vs #{@p2.name}: #{@p2.lives}/3"
      puts "------- NEW TURN -------"
      current_player == @p1 ? current_player = @p2 : current_player = @p1
    end
  end

  def end_game
    @p1.lives > 0 ? winner = @p1 : winner = @p2
    puts "We have a winner!"
    if winner.lives > 1
      puts "#{winner.name} wins the game with #{winner.lives} lives left!"
    else
      puts "#{winner.name} wins the game with one life left!"
    end
    puts "See you next time!"
    puts "--------------------G A M E  O V E R----------------"
  end
  
end