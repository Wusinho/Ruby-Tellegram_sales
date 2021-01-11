# frozen_string_literal: true

require 'date'
require 'themoviedb-api'

class Search_movie
  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
    
    
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



  def movie_overview(bot, message, user_input)
    index = user_input[5..6].to_i
      bot.api.send_message(chat_id: message.chat.id, text: "#{@search[index]['original_title']} " "/add#{index}")
      bot.api.send_message(chat_id: message.chat.id, text: "Release date: #{@search[index]['release_date']} ")
      bot.api.send_message(chat_id: message.chat.id, text: "Movie overview: #{@search[index]['overview']}  ")
  end

  def add_cart(bot, message, user_input, cart_list)
    index = user_input[4..5].to_i
    bot.api.send_message(chat_id: message.chat.id, text: "Your Cart list:" )

    unless @search[0].nil?
    cart_list << @search[index]['original_title']
    cart_list.each_with_index do |ele, index|

    
    bot.api.send_message(chat_id: message.chat.id, text: "#{index+1}.-  #{ele}")
    end
    end
    
  end

#private 

  def pay(bot, message, arr, cost)
    total = arr.count * cost
    bot.api.send_message(chat_id: message.chat.id, text: "Your total purchase is $#{total}")
    
  end

 

end
