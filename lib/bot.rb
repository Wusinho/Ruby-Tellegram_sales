# frozen_string_literal: true

require 'telegram/bot'

require_relative 'logic'

class Bot
  def initialize
    @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
    @logic = Search_movie.new

    @search_info = []
   

    @user_list = []

    @cost = 1

    puts 'running'
  end

  def start_sale
    Telegram::Bot::Client.run(@token_telegram) do |bot|
      bot.listen do |message|
        @user_name = message.from.first_name
        @user_input = message.text
        
        if @user_input == '/start'
          
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{@user_name}.")
        
        elsif @user_input[0..4] == '/info'

          @logic.info(bot, message, @user_input)

        else

          @logic.search_title(@user_input)
        
          @logic.show(bot, message)

          

        end
      end
    end
  end

 


end


