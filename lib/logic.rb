# frozen_string_literal: true

require 'date'
require 'themoviedb-api'

class Search_movie
  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
  end

  def search_title(name, detail)
    Tmdb::Api.key(@token_tmdb)

    search = Tmdb::Search.movie(name).results

    unless search[0].nil?

      search.each_with_index do |ele, index|
        show(bot, message, search[index][detail])
      end
    end
  end

  def add_movie(arr, input)
    arr << input
  end

  def premiere(release_date)
    date_now = DateTime.now

    novie_release = (DateTime.parse(release_date)) >> 1

    date_now > novie_release ? 'Regular' : 'Just Released'
  end

  def pay(arr, cost)
    arr.count * cost
  end

  def show(bot, message, new_array)
    new_array.each do |ele|
      bot.api.send_message(chat_id: message.chat.id, text: "Your movie list : #{ele}  ")
    end
  end

end


#nuevo = Search_movie.new

#nuevo.search_details('alien', 'original_title')