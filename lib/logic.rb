# frozen_string_literal: true

require 'date'
require 'themoviedb-api'

class Search_movie
  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
    @user_search = []
    
    @search = []
  end

  def search_title(name)
    Tmdb::Api.key(@token_tmdb)

    @search = Tmdb::Search.movie(name).results

      
      unless @search[0].nil?
        @search
       
    end
  end
  

  def show(bot, message)

    @search.each_with_index do |ele, index|
      bot.api.send_message(chat_id: message.chat.id, text: "Your title search : #{@search[index]['original_title']} " "/info#{index}")

    end 
  end



  def info(bot, message, user_input)
    index = user_input[5..6].to_i
      bot.api.send_message(chat_id: message.chat.id, text: "#{@search[index]['original_title']} " "/add#{index}")
      bot.api.send_message(chat_id: message.chat.id, text: "#{@search[index]['overview']}  ")
  end

  def add_cart(bot, message, user_input, cart_list)
    index = user_input[4..5].to_i

    unless @search[0].nil?
    cart_list << @search[index]['original_title']
    cart_list.each_with_index do |ele, index|

    bot.api.send_message(chat_id: message.chat.id, text: "#{index+1}.-  #{ele}")
    end
    end
    
  end



  def premiere(release_date)
    date_now = DateTime.now

    novie_release = (DateTime.parse(release_date)) >> 1

    date_now > novie_release ? 'Regular' : 'Just Released'
  end

  def pay(arr, cost)
    arr.count * cost
  end

 

end


#nuevo = Search_movie.new

#nuevo.search_title('dsadsa', 'original_title')