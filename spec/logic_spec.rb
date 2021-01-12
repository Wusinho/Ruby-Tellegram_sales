# frozen_string_literal: true

require_relative '../lib/logic'
require 'rspec'

describe Search_movie do
  
    it 'looks if the movie exists' do
      movie_title = Search_movie.new
      expect(movie_title.search_title('dsadsadsa')).to eql(nil)
    end

    it 'it looks for the movie' do
      movie_title = Search_movie.new
      expect(movie_title.search_title('terminator')).to be_a(Array)
    end

    it 'gives the list of match search' do
      movie_title = Search_movie.new
      expect(movie_title.show_list(bot, message)).to be_a(Array)
    end


    it 'returns the total amount you will need to pay' do
      pay = Search_movie.new
      expect(pay.pay(bot, message, ['terminator', 'the croods'], 1)).to eql("Your total purchase is $2")
    end

    it 'returns the total amount you will need to pay' do
      pay = Search_movie.new
      expect(pay.pay(bot, message, [], 1)).to eql("Your total purchase is $0")
    end
  
end
