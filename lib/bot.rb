# frozen_string_literal: true

require 'telegram/bot'

require_relative 'logic'

class Bot

  attr_accessor :search, :index

  def initialize
    @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
    @logic = Search_movie.new
    @search = search
    @index = index
    @pepe = []
    @cart_list = []

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
          bot.api.send_message(chat_id: message.chat.id, text: instruction)

        elsif @user_input[0..4] == '/info'

          indexo = @logic.movie_overview(@user_input, index)

          bot.api.send_message(chat_id: message.chat.id, text: "#{@pepe[indexo]['original_title']} " "/add#{indexo}")
          
          bot.api.send_message(chat_id: message.chat.id, text: "Movie overview: #{@pepe[indexo]['overview']}  ")

        elsif @user_input[0..3] == '/add'
          @logic.add_cart(@user_input, @cart_list, search)

          bot.api.send_message(chat_id: message.chat.id, text: 'Your Cart list:')
          bot.api.send_message(chat_id: message.chat.id, text: "Movie overview: #{@cart_list}  ")

        elsif @user_input == '/pay'

          @logic.pay(@cart_list, @cost)
          bot.api.send_message(chat_id: message.chat.id, text: "Your total purchase is $#{total}")

        else
          
          
          @pepe = @logic.search_title(@user_input, search)
          
          @logic.show_list(bot, message, @pepe)  
          

        end
      end
    end
  end

  def instruction
    "You can search for any kind of movies you want
    All movies cost $#{@cost}
    Instruction :
    1.- Search for the title of a movie you want to see.
    2.- Click /info to have a brief description of the movie.
    3.- Click /add to put the movie into your cart. If you do not want it you can keep searching.
    4.- Type /pay to purchase all the movies from your list."
  end
end
