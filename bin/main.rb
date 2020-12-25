# frozen_string_literal: true

require_relative '../lib/bot'

def welcome
    'You can search for any movies you want
    All movies cots $1  
    Instruction :
    1.- Search for the title of a movie you want to see
    2.- Type /add to put the movie into your cart if you do not want it you can continue searching
    3.- Type /pay to purchase all the movies from your list'
end




nuevo = Bot.new
nuevo.start_sale
