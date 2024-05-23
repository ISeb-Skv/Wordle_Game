require_relative '../lib/wordle_game'
require 'minitest/autorun'

class TestWordleGame < Minitest::Test
  def setup
    @game = WordleGame.new
  end

  def test_submit_attempt_successful_guess
    assert_equal "Ответ получен. Загаданное слово: #{@game.instance_variable_get(:@word_to_guess)}", @game.submit_attempt(@game.instance_variable_get(:@word_to_guess))
  end

  def test_submit_attempt_invalid_length
    assert_equal "Ваша попытка должна быть точно из #{@game.instance_variable_get(:@word_length)} букв", @game.submit_attempt("invalid")
  end

  def test_submit_attempt_out_of_attempts
    @game.instance_variable_set(:@attempts, 0)
    assert_equal "Попытки закончились", @game.submit_attempt("apple")
  end

  def test_submit_attempt_incorrect_guess
    @game.instance_variable_set(:@attempts, 1)
    result = @game.submit_attempt("zzzzz")
    assert(result.include?("Ответ не получен, есть еще попытки (#{@attempts}).") || result.include?("Попытки закончились"))
  end
end