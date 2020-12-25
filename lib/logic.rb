# frozen_string_literal: true

require 'date'
require 'themoviedb-api'

class Search_movie
  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
  end

  def search_title(name, detail, _array)
    Tmdb::Api.key(@token_tmdb)

    search = Tmdb::Search.movie(name, language: 'en').results

    unless search[0].nil?

      array = search[0]

      search.each_with_index do |ele, index|
        return search[index]['original_title']    
      end

  end

  def add_movie(arr, input)
    arr << input
  end

  def premiere(release_date)
    date_now = DateTime.now

    novie_release = (DateTime.parse(release_date)) >> 1

    date_now > novie_release ? 'Regular' : 'Premier'
  end

  def pay(arr, cost)
    arr.count * cost
  end
end
