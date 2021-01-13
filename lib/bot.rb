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
    @movie_search = []
    @cart_list = []
    @cost = 1
    @total = 0
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

          @index = @logic.movie_index(@user_input)

          bot.api.send_message(chat_id: message.chat.id, text: "#{@movie_search[@index]['title']} " "/add#{@index}")
          bot.api.send_message(chat_id: message.chat.id, text: "Brief Overview : #{@movie_search[@index]['overview']} ")
          
        elsif @user_input[0..3] == '/add'
          @logic.add_cart(@user_input, @movie_search, @cart_list)

          bot.api.send_message(chat_id: message.chat.id, text: 'Your Cart list:')
          bot.api.send_message(chat_id: message.chat.id, text: "Movie overview: #{@cart_list}  ")

        elsif @user_input == '/pay'

          @total = @logic.pay(@cart_list, @cost)
          bot.api.send_message(chat_id: message.chat.id, text: "Your total purchase is $#{@total}")

        else
          
          @movie_search = @logic.search_title(@user_input, search)         
          @logic.show_list(bot, message, @movie_search)  
          
        end
      end
    end
  end

  private
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
