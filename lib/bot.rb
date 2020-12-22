require 'telegram/bot'
require 'themoviedb-api'
require 'faker'
require 'date'
require_relative 'logic'



class Bot
  attr_reader :token_telegram, :logic

  def initialize
    @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
    @name_bot = Faker::Name.name
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
      bot.api.send_message(chat_id: message.chat.id, text: "Hello I am #{@name_bot}, I will be your assistant today. #{welcome}" )

      when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Goodbye #{@user_name}")
      
      when '/add'
      
      #logic.add_movie(@user_movies, @user_search)
      #@show = show(bot, message, @user_movies)
      
      when '/pay'
      @pay = logic.pay(@user_movies, @cost)
        bot.api.send_message(chat_id: message.chat.id, text: "Your total check is  #{@pay} $")
      
      
      else
      
      @user_search = logic.search_title(@user_input)
      premiere
      @movie_sum = logic.movie_synopxis
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
    Just type /add to put the movie into cart
    Just type /pay to purchase your list of movies'

    
  end

  def premiere

    # puts @Movie_details
     #    puts @search[0]
      date_now = DateTime.now
     
      novie_release = DateTime.parse(@search[0]['release_date']) >> 1
     
      date_now > novie_release ? 'Regular' : 'Premier'
    
 end




end


nuevo = Bot.new
nuevo.start_sale


