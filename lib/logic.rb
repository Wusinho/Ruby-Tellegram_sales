# frozen_string_literal: true

require 'date'
require 'themoviedb-api'

class Search_movie
  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
    @user_search = []
    
    @search = []
  end

  def search_title(name, bot,message)
    Tmdb::Api.key(@token_tmdb)

    @search = Tmdb::Search.movie(name).results

      
      unless @search[0].nil?
        @search
       
    end
  end
  
  def show(bot, message)
    @search.each_with_index do |ele, index|
    
      bot.api.send_message(chat_id: message.chat.id, text: "Your search : #{@search[index]['original_title']}  /info")
     
    end 
  end

  def show(bot, message)
    @search.each_with_index do |ele, index|
      bot.api.send_message(chat_id: message.chat.id, text: "Your search : #{@search[index]['original_title']}  /info")
     
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