#  Manages turns in game. Interacts from player answers accordingly

require './question'
require './player'

class Turn

  def initialize(player)
    @turn_player = player
    @question = Question.new
    @answer = @question.answer
    play_turn
  end

  def play_turn
    puts "#{@turn_player.name}:"
    puts "What is the answer to #{@question.question}?"
    print "> "
    player_answer = $stdin.gets.chomp
      # Verify if answer checks with Question assessment AND is a number
      if player_answer.to_f == @answer && player_answer =~ /\d/
        puts "Way to go #{@turn_player.name}! That's correct!"
      else
        @turn_player.lose_life
        if @turn_player.lives > 1
          puts "Too bad... wrong answer! You now have #{@turn_player.lives} lives left."
        else
          puts "Too bad... wrong answer! Watch out, this is your last life!"
        end
      end
  end

end