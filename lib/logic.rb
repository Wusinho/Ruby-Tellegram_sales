require 'date'
require 'themoviedb-api'


class Search_movie

  def initialize
    @n_premier = 0
    @cost_premier = 1.5
    @n_regular = 0
    @cost_regular = 1
    @search = []  
    @Movie_details = []
  end

    def premiere
        date_now = DateTime.now
        
        novie_release = DateTime.parse(@search[0]['release_date']) >> 1
        
        date_now > novie_release ? 'Regular' : 'Premier'
       
    end

    def search_title(name)
        Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
        
          @search = Tmdb::Search.movie(name, language: 'en').results
          @Movie_details = @search[0]
          

          if @Movie_details != nil 
            

            return @search[0]['original_title']

          else

            return "We'are sorry it's not in our database "

          end
    end
        
    def movie_synopxis

       return @Movie_details['overview']
      
    end

     

    def add_movie(array, input)

      if premiere == 'Premier'
        @n_premier += 1

        array << input

      else
        @n_regular += 1
        array << input

      end


    end

    def pay(no_parameter=nil, no_parameter0=nil)

      return (@n_premier*@cost_premier )+ (@n_regular*@cost_regular)
      
    end    



end
