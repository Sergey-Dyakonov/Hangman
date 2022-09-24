class Hangman
  @@word = ""
  @@hidden_word

  public def initialize
    response = URI.open("https://random-word-api.herokuapp.com/word").read
    @@word = response[2...response.length - 2]
    @@hidden_word = "_" * @@word.length
  end

  public def guess_letter letter
    offset = 0
    is_correct_guess = false
    @@word.each_char { |c|
      if c == letter && !@@hidden_word.include?(c)
        index = @@word.index(c, offset)
        @@hidden_word[index] = letter
        offset = index + 1
        is_correct_guess = true
      end
    }
    is_correct_guess
  end

  public def get_hidden_word
    @@hidden_word
  end

  public def get_word
    @@word
  end
end
