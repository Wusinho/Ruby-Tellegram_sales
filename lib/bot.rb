require 'telegram/bot'
require 'themoviedb-api'
require 'faker'
require 'date'
require_relative 'logic'



class Bot

  def initialize
  @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
  logic = Search_movie.new
  @name_bot = Faker::Name.name


  Telegram::Bot::Client.run(@token_telegram) do |bot|
    bot.listen do |message|
      @user_name = message.from.first_name
      @user_input = message.text
      
      
      bot.api.send_message(chat_id: message.chat.id, text: "Hello I am #{@name_bot}, I will be your assistant today")
      bot.api.send_message(chat_id: message.chat.id, text: "Your search : #{@user_input} ")
      #@prueba = logic.search_title(@user_input)
      @prueba2 = logic.search_actor(@user_input)
      bot.api.send_message(chat_id: message.chat.id, text: " #{@prueba2}")



        
      

     
    end
  end
end


end

