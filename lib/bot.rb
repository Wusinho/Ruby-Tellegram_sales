# frozen_string_literal: true

require 'telegram/bot'
require 'faker'
require_relative 'logic'

class Bot
  def initialize
    @token_telegram = '1407248820:AAF3aSx6WGfGQqWSfDx6odMpDEiZzUsCE2I'
    @logic = Search_movie.new

    @search_info = []
    @movie_title = []
    @movie_sin = []
    @movie_prem = []

    @user_movies = []

    @cost = 1
  end

  def start_sale
    Telegram::Bot::Client.run(@token_telegram) do |bot|
      bot.listen do |message|
        @user_name = message.from.first_name
        @user_input = message.text
        case @user_input
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello #{@user_name}. Welcome to Movies, #{welcome}")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Goodbye #{@user_name}")

        when '/add'

          @logic.add_movie(@user_movies, @movie_title)

          @show = show(bot, message, @user_movies)

        when '/pay'

          @pay = @logic.pay(@user_movies, @cost)
          bot.api.send_message(chat_id: message.chat.id, text: "Your total check is  #{@pay} $")
          @user_movies.clear

        else

          @movie_title = @logic.search_title(@user_input, 'original_title', @search_info)
          unless @movie_title.nil?
            @movie_overview = @logic.search_title(@user_input, 'overview', @search_info)
            @release_date = @logic.search_title(@user_input, 'release_date', @search_info)

            @movie_prem = @logic.premiere(@release_date)

            bot.api.send_message(chat_id: message.chat.id, text: "Movie title #{@movie_title}")
            bot.api.send_message(chat_id: message.chat.id, text: @movie_overview.to_s)
            bot.api.send_message(chat_id: message.chat.id, text: @movie_prem.to_s)

          end

        end
      end
    end
  end

  def show(bot, message, new_array)
    new_array.each do |ele|
      bot.api.send_message(chat_id: message.chat.id, text: "Your movie list : #{ele}  ")
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

# nuevo = Bot.new
# nuevo.start_sale
