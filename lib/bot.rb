require 'telegram/bot'
require 'themoviedb-api'
require 'faker'
require 'date'
require_relative 'logic'



class Bot

def initialize
@token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
@token_movie = '2ed8d3de86cb00cde812d0ade32ea313'
time = Time.now.to_s
@time_today = DateTime.parse(time).strftime("%Y-%m-%d")
logic = Search_movie.new


@name_bot = Faker::Name.name
Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')

  Telegram::Bot::Client.run(@token_telegram) do |bot|
    bot.listen do |message|
      @user_name = message.from.first_name
      @user_input = message.text
      
      
      bot.api.send_message(chat_id: message.chat.id, text: "Hello I am #{@name_bot}, I will be your assistant today #{@time_today}")
      


        bot.api.send_message(chat_id: message.chat.id, text: "You searched : #{@user_input} ")
         @prueba = logic.search_title(@user_input)
         bot.api.send_message(chat_id: message.chat.id, text: "#{@prueba}")



        
      

     
    end
  end
end


end

