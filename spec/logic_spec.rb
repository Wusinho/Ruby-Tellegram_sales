# frozen_string_literal: true

require 'telegram/bot'

require_relative '../lib/logic'
require 'rspec'

describe Search_movie do
  let(:start) { Search_movie.new }

  it 'looks for the movie if exists' do
    expect(start.search_title('dsadsadsa')).to eql(nil)
  end

  it 'it looks for the movie' do
    expect(start.search_title('terminator')).to be_a(Array)
  end



  
end
