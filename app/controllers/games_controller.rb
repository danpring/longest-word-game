require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    array = (0...9).map { (65 + rand(26)).chr }.join
    @letters = array.split('')
  end

  def score
    dictionarytest(params[:word])
    letterstest(params[:word])
  end

  def dictionarytest(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    @dictionarytest = JSON.parse(open(url).read)
  end

  def letterstest(word)
    word.capitalize
    @letterstest = word.chars.all? { |letter| word.count(letter) <= params[:letters].count(letter.capitalize) }
  end
end
