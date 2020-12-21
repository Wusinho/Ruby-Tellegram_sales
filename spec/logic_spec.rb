require_relative '../lib/logic'
require 'rspec'


describe Search_movie do
    describe 'premiere:' do
      it 'tells if a movie is premiere or not' do
        movie_release = Search_movie.new
        expect(movie_release.premiere('2020-12-11')).to eql("No es de estreno")
      end
      
    end
  end

