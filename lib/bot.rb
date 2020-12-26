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
  end

  def start_sale
    Telegram::Bot::Client.run(@token_telegram) do |bot|
      bot.listen do |message|
        @user_name = message.from.first_name
        @user_input = message.text
        case @user_input
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{@user_name}.")

        when '/stop'
          

        when '/add'
          
          
        
         
        when '/pay'

        when '/info'
          

        else

          @logic.search_title(@user_input, bot, message)
        
          @logic.show(bot, message)

          #@search_info.clear

        end
      end
    end
  end

 


end


