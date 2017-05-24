class Game
  attr_reader :number_of_guesses, :continue
  def initialize (password)
    puts "Initializing Game..."
    @continue = true;
    @password = password.split("")
    @number_of_guesses = password.gsub(/\s+/, "").strip.length
    @guess = []
    @phrase = init(password)
    puts "Game initialized - Lets Play!"
  end

  def password
    @password.join("")
  end

  def init(password)
  new_array = password.split("")
  new_array.map! {|letter|
    if letter != " "
      letter = "_"
    else
      letter = " "
    end
  }
  end

  def update_phrase(letter)
    @password.length.times {|index|
      if letter.downcase == password[index].downcase
          @phrase[index] = password[index]
      end
    }
    if !@phrase.include?(letter)
      puts "There's no #{letter}"
    end
  end

  def get_phrase
    @phrase.join(" ")
  end

  def win?
    @phrase == @password
  end

  def guessed_right_word?(letter)
    return_value = true
    if @password.length == letter.length
    @password.length.times {|index|
      if letter[index].downcase != password[index].downcase
          return_value = false
      end
    }
    else
      return_value = false
    end
    return return_value
  end

  def update_game(letter)
    if letter.length > 1
      if guessed_right_word?(letter)
        @phrase = @password
      else
        puts "#{letter} is not the Right Word"
      end
    else
      update_phrase(letter)
    end
    update_guess_count
    if win?
      @continue = false
    elsif @number_of_guesses == 0
      @continue = false
    end
  end

  def update_guess_count
    @number_of_guesses -= 1
  end

  def guess(letter)
    if (@guess.include?(letter) == true)
      puts "You've Already Guessed #{letter}"
    else
      @guess << letter
      update_game(letter)
    end
  end
end



################### Driver Code #######################
puts "lets play a game - Please Enter a Word or Phrase"
secret_word = gets.chomp
new_game = Game.new(secret_word)
system "clear"

puts "Alright! Lets Play!!! "
while (new_game.continue)
  puts new_game.get_phrase
  puts "Enter a Word or Letter (you have #{new_game.number_of_guesses} left)"
  secret_word = gets.chomp
  new_game.guess(secret_word)
end

if new_game.win?
  puts "You win!!! Great Job!"
else
  puts "You Lose =( Better luck Next time, The word was #{new_game.password}"
end

