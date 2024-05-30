class WordleGame
  attr_reader :word_length

  def initialize
    @words = ["pizza", "bread", "pasta", "salad", "sushi", "burger", "donut", "bacon", "olive", "honey"] # список слов
    @attempts = 6  # количество попыток
    @word_to_guess = @words.sample  # выбор случайного слова
    @word_length = @word_to_guess.length
    @guessed_letters = Array.new(@word_length, false)  # массив для отслеживания угаданных букв
  end

  def submit_attempt(attempt)
    return "Попытки закончились" if @attempts <= 0
    return "Ваша попытка должна быть точно из #{@word_length} букв" if attempt.length != @word_length

    @attempts -= 1

    if attempt.nil?
      puts "Ошибка: ввод не распознан"
      return
    end
    attempt = attempt.chomp

    if attempt.downcase == @word_to_guess
      return "Ответ получен. Загаданное слово: #{@word_to_guess}"
    end

    result = ""
    correct_letters = []
    attempt.downcase.each_char.with_index do |letter, index|
      if @word_to_guess.include?(letter)
        if @word_to_guess[index] == letter
          correct_letters << letter
          @guessed_letters[index] = true
        end
      end
    end

    @word_to_guess.each_char.with_index do |letter, index|
      if correct_letters.include?(letter)
        result += "#{letter}"  # буква на своем месте
      else
        result += "_"
      end
    end

    if @attempts.zero?
      return "Попытки закончились. Загаданное слово: #{@word_to_guess}"
    else
      return "Ответ не получен, есть еще попытки (#{@attempts}). Загаданное слово: #{result}"
    end
  end
end


game = WordleGame.new
puts "Угадайте слово из #{game.word_length} букв"

loop do
  print "Введите вашу попытку: "
  attempt = gets.chomp
  status = game.submit_attempt(attempt)
  puts status
  break if status.include?("Ответ получен") || status.include?("Попытки закончились")
end
