# frozen_string_literal: true

require 'date'
require 'themoviedb-api'
require 'telegram/bot'

class Search_movie

  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
  end

  def search_title(name, container)
    Tmdb::Api.key(@token_tmdb)

    container = Tmdb::Search.movie(name).results

    container unless container[0].nil?
  end

  def show_list(bot, message, container)
    unless container[0].nil?

    container.each_with_index do |ele, index|
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Your title search : #{container[index]['title']} " "/info#{index}")
    end
  end
end 




  def movie_overview(user_input)
    user_input[5..6].to_i
  end




  def add_cart(user_input, container, cart_list)
    index = user_input[4..5].to_i

    unless container[0].nil?
      cart_list << container[index]['original_title']
    end
  end





  def pay(arr, cost)
    arr.count * cost
  end

end
