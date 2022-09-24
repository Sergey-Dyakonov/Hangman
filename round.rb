class Round
  def initialize
    @attempts = 6
    @hangman = Hangman.new
    @is_finished = false
    puts "------------------------------------"
    puts "New round started! Guess the word..."
  end

  public def play
    if @attempts != 0
      play_game
    else
      if @hangman.get_word == @hangman.get_hidden_word
        puts "Congrats! You win!"
      else
        puts "Game over... The word was #{@hangman.get_word}"
      end
      puts "----------------------------------"
      @is_finished = true
    end
  end

  public def is_finished
    @is_finished
  end

  def play_game
    print "Enter a letter:"
    letter = gets.chomp
    if is_letter letter
      result = @hangman.guess_letter letter
      if result
        print_with_spaces @hangman.get_hidden_word
      else
        letter_missed
      end
    else
      puts "You need enter a letter, try again!"
    end
  end

  private def letter_missed
    @attempts -= 1
    puts "So pity... You have #{@attempts} lives"
  end

  private def is_letter(letter)
    letter =~ /^[a-z]$/i
  end

  private def print_with_spaces(word)
    word.chars.each { |c|
      print c + " "
    }
    puts
  end
end
