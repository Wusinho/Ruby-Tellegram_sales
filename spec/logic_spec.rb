# rubocop disable:  Lint/UselessAssignment

require 'telegram/bot'
require_relative '../lib/logic'
require 'rspec'

describe SearchMovie do
 
  let(:start) { SearchMovie.new }

  it 'looks for the movie if exists' do
    expect(start.search_title('dsadsadsa', [])).to eql(nil)
  end

  it 'finds the movie' do
    expect(start.search_title('terminator', [])).to be_a(Array)
  end

  it "doesn't print anything because it didn't find the movie" do
    expect(start.show_list('bot', 'message', [])).to eql(nil)
  end

  it 'gives error when the arguments are not complete' do
    expect { start.show_list('bot', 'message') }.to raise_error(ArgumentError)
  end

  it 'finds the movie index in the list' do
    expect(start.movie_index('/info22')).to eql(22)
  end

  it 'is 0 if it is not in the list' do
    expect(start.movie_index('')).to eql(0)
  end

  it "is empty when you haven't add anything to the shopping cart" do
    expect(start.add_cart('/add1', [], [])).to eql(nil)
  end

  it 'add the movie to a list' do
    expect(start.add_cart('/add1', ['Croods', 'Croodsx'], [])).to be_a(Array)
  end

  it 'is the total amount of money you will pay' do
    expect(start.pay([1, 2, 3, 4], 2)).to eql(8)
  end

  it 'is 0 if there are no movies that you want' do
    expect(start.pay([], 4)).to eql(0)
  end
end

# rubocop enable:  Lint/UselessAssignment
