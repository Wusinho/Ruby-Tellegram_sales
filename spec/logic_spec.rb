require_relative '../lib/logic'
require 'rspec'
require 'date'


describe Search_movie do
    describe 'premiere:' do
      it 'tells if a movie is premiere or not' do
        movie_release = Search_movie.new
        expect(movie_release.premiere('2020-12-11')).to eql("Pelicula de Estreno")
      end
      
      it 'tells if a movie is premiere or not' do
        movie_release = Search_movie.new
        expect(movie_release.add_movie([1], 'hello')).to eql([1, 'hello'])
      end
      




    end
  end

