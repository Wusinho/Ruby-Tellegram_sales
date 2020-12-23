require_relative '../lib/logic'
require 'rspec'
require 'date'


describe Search_movie do
    describe 'premiere:' do
      it 'tells if a movie is premiere or not' do
        is_premiere = Search_movie.new
        expect(is_premiere.premiere('2020-12-11')).to eql("Premier")
      end
      
      it 'add a movie into the array' do
        add_arr = Search_movie.new
        expect(add_arr.add_movie([1], 'hello')).to eql([1, 'hello'])
      end
      
      it 'looks if the movie exists' do
        movie_title = Search_movie.new
        expect(movie_title.search_title('dsadsadsa','original_title', [])).to eql(nil)
      end

      it 'it looks for the movie' do
        movie_title = Search_movie.new
        expect(movie_title.search_title('terminator','original_title', [])).to eql('The Terminator')
      end

      it 'returns the total amount you will need to pay' do
        pay = Search_movie.new
        expect(pay.pay(['terminator', 'the croods'], 1 )).to eql(2)
      end

      it 'returns the total amount you will need to pay' do
        pay = Search_movie.new
        expect(pay.pay([], 1 )).to eql(0)
      end

    end
  end

