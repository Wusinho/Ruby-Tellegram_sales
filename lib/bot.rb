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

    @switch = [1]

    while @switch != []
      
    Telegram::Bot::Client.run(@token_telegram) do |bot|
    bot.listen do |message|
      @user_name = message.from.first_name
      @user_input = message.text
      case @user_input
      when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello I am #{@name_bot}, I will be your assistant today.")

      when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Goodbye #{@user_name}")
      
      when '/add'
      logic.add_movie(@user_movies, @user_search)
      @show = logic.show(@user_movies)
      bot.api.send_message(chat_id: message.chat.id, text: "Your movie list #{@show}")

      else
      bot.api.send_message(chat_id: message.chat.id, text: "Your search : #{@user_input} ")
      @user_search = logic.search_title(@user_input)
      
      bot.api.send_message(chat_id: message.chat.id, text: "#{@user_search}")

      end
    end
    end
    end
  end


end


nuevo = Bot.new
nuevo.start_sale


