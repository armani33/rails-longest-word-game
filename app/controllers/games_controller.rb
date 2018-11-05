require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def home
    letters = (65..90).to_a
    @letters_game = []
    10.times do
      @letters_game << letters.sample.chr
    end
  end

  def check
    @letters_play = params["letters"].split(" ")
    @word.upcase.split("").all? do |char|
    @letters_play.delete_at(@letters_play.index(char)) if @letters_play.include? char
    end
  end

  def score
    @word = params["word"]
    @result = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@word}").read)

    if @word.length != 0
      if @result["found"] == true
        if check
          @answer = "Congratulation!"
          @score = @result["length"].to_s
        else
          @answer = "You cheat! you used an other letter! "
          @score = 0
        end
      else
        @answer = "the word that you type doesn't exist"
        @score = 0
      end
    else
      @score = 0
    end
  end
end
