require 'telegram/bot'
require 'faker'
require_relative 'logic'



class Bot
  

  def initialize
    @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
    
    @logic = Search_movie.new
    @user_search = []
    @user_movies = ['zero']
    

   
  end

  def start_sale
      
    Telegram::Bot::Client.run(@token_telegram) do |bot|
    bot.listen do |message|
      @user_name = message.from.first_name
      @user_input = message.text
      case @user_input
      when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello #{@user_name}. Welcome to Movies, #{welcome}" )

      when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Goodbye #{@user_name}")
      
      when '/add'
      
      @logic.add_movie(@user_movies, @user_search)
      @show = show(bot, message, @user_movies)
      
      when '/pay'
      @pay = @logic.pay
      bot.api.send_message(chat_id: message.chat.id, text: "Your total check is  #{@pay} $")
      @logic.empty
      else
      
      @user_search = @logic.search_title(@user_input)
      @movie_sum = @logic.movie_synopxis
      
      @premiere = @logic.premiere
      bot.api.send_message(chat_id: message.chat.id, text: "Movie title #{@user_search}")
      bot.api.send_message(chat_id: message.chat.id, text: "#{@premiere}")
      bot.api.send_message(chat_id: message.chat.id, text: "#{@movie_sum}")

      end
    end
    end
    
  end

  def show(bot, message, new_array)     
      new_array.each_with_index do |ele, index| 
      if index > 0
        bot.api.send_message(chat_id: message.chat.id, text: "Your movie list" + "\n" + "#{index}.- #{ele}  ")
      
      end
    end
  end

  def welcome
    'You can search for any movies you want 
    Premier cost 1.5 and Regular 1
    Instruction :
    1.- Search for the title of a movie you want to see
    2.- Type /add to put the movie into your cart if you do not want it you can continue searching
    3.- Type /pay to purchase all the movies from your list'

    
  end

 



end


#nuevo = Bot.new
#nuevo.start_sale


