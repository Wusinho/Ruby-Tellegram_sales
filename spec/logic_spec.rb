# frozen_string_literal: true

require 'telegram/bot'

require_relative '../lib/logic'
require 'rspec'

describe Search_movie do

#arr = [<Tmdb::Movie adult=false, backdrop_path="/cjaOSjsjV6cl3uXdJqimktT880L.jpg", genre_ids=[12, 14, 10751, 16], id=529203, original_language="en", original_title="The Croods: A New Age", overview="Searching for a safer habitat, the prehistoric Crood family discovers an idyllic, walled-in paradise that meets all of its needs. Unfortunately, they must also learn to live with the Bettermans -- a family that's a couple of steps above the Croods on the evolutionary ladder. As tensions between the new neighbors start to rise, a new threat soon propels both clans on an epic adventure that forces them to embrace their differences, draw strength from one another, and survive together.", popularity=1419.345, poster_path="/tK1zy5BsCt1J4OzoDicXmr0UTFH.jpg", release_date="2020-11-25", title="The Croods: A New Age", video=false, vote_average=7.8, vote_count=1084>
#<Tmdb::Movie adult=false, backdrop_path="/7JCYI5Xrgt21fEQXIZ2ZFCRhyqK.jpg", genre_ids=[28, 12, 16, 35, 10751, 14], id=49519, original_language="en", original_title="The Croods", overview="The prehistoric Croods family live in a particularly dangerous moment in time. Patriarch Grug, his mate Ugga, teenage daughter Eep, son Thunk, and feisty Gran gather food by day and huddle together in a cave at night. When a more evolved caveman named Guy arrives on the scene, Grug is distrustful, but it soon becomes apparent that Guy is correct about the impending destruction of their world.", popularity=125.022, poster_path="/27zvjVOtOi5ped1HSlJKNsKXkFH.jpg", release_date="2013-03-20", title="The Croods", video=false, vote_average=6.9, vote_count=5129>
#<Tmdb::Movie adult=false, backdrop_path="/d0pxSlkm3ilFLzNkHbbweRZdOFy.jpg", genre_ids=[16], id=501861, original_language="en", original_title="The Croodaceous Creatures of 'Croods'", overview="The Croods Shorts", popularity=6.454, poster_path=nil, release_date="2013-03-22", title="The Croodaceous Creatures of 'Croods'", video=false, vote_average=7, vote_count=1>]

  let(:start) { Search_movie.new }

  it 'looks for the movie if exists' do
    expect(start.search_title('dsadsadsa', [])).to eql(nil)
  end

  it 'finds the movie' do
    expect(start.search_title('terminator', [])).to be_a(Array)
  end

  it "doesn't print anything because it didn't find the movie" do
    expect(start.show_list('bot', 'message', [])).to eql(nil)
  end

  it "gives error when the arguments are not complete" do
    expect{start.show_list('bot', 'message' )}.to raise_error(ArgumentError)
  end

  it 'finds the movie index in the list' do
    expect(start.movie_index('/info22')).to eql(22)
  end

  it 'is 0 if it is not in the list' do
    expect(start.movie_index('')).to eql(0)
  end

  it "is empty when you haven't add anything to the shopping cart" do
    expect(start.add_cart("/add1", [], [])).to eql(nil)
  end

  it 'add the movie to a list' do
    expect(start.add_cart("/add1", [original_title="Croods", original_title="Croods"], [])).to be_a(Array)
  end

  it 'is the total amount of money you will pay' do
    expect(start.pay([1,2,3,4], 2 )).to eql(8)
  end

  it 'is 0 if there are no movies that you want' do
    expect(start.pay([], 4 )).to eql(0)
  end
end



