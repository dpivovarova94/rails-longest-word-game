require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    # @letters = ('A'..'Z').to_a.sample(10)
    alphabet = ("A".."Z").to_a
    @letters = Array.new(10) do
      alphabet.sample
    end
  end

  def valid_word?(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    url_serialized = URI.open(url).read
    json_file = JSON.parse(url_serialized)
    json_file["found"]
  end

  # def attempt_uses_letters_from_the_grid?(attempt, grid)
  #   char_array = attempt.chars
  #   if_uses_letter_from_grid = true
  #   char_array.each do |letter|
  #     if_uses_letter_from_grid = false unless grid.include? letter
  #   end
  #   if_uses_letter_from_grid
  # end

  # def valid_letters?(attempt, grid)
  #   char_array = attempt.chars
  #   # char_array_checking = []
  #   if_valid_letter = true
  #   char_array.each do |letter|
  #     if_valid_letter = false unless attempt.count(letter) <= grid.join.count(letter)
  #   end
  #   if_valid_letter
  # end

  # def run_game(attempt, grid)
  #   if valid_word?(attempt)
  #     if attempt_uses_letters_from_the_grid?(attempt, grid)
  #       if valid_letters?(attempt, grid)
  #         @message = "You won"
  #       else
  #         @message = "You lost because the overused the letters from the grid"
  #       end
  #     else
  #       @message = "You lost because the letters you used are not in the grid"
  #     end
  #   else
  #     @message = "You lost because the word is not a proper English word"
  #   end
  # end

  def score
    # raise
    attempt = params[:word]
    if valid_word?(attempt)
      @message = " is a valid word!"
    end
  end
end
