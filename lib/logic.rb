require 'date'
require 'themoviedb-api'


class Search_movie
  attr_accessor :new_array

  def initialize
    @user_pick = {
      movie_tile: '' ,
      movie_synopsis: '',
      premiere: 0,
      regular: 0
    }
    @search = []
  
  end




    def premiere(release_date)
        date_now = DateTime.now
        
        novie_release = DateTime.parse(release_date) >> 1
        
        date_now > novie_release ? 'No es de estreno' : 'Pelicula de Estreno'
       
    end

    def search_title(name)
        Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
        
          @search = Tmdb::Search.movie(name, language: 'en').results

          

          if @search[0] != nil 

          return @search[0]['original_title']

          else

            return "We'are sorry it's not in our database "

          end
    end
        
      # def search_actor(name)
      #     Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
              
      #     search = Tmdb::Search.person(name).results 
        
      #    if search[0] != nil
      #     array = search[0]['known_for']
      #     array.each_with_index {|ele, index| return array[index]['original_title'] }
            
      #    else
      #      puts  "We'are sorry it's not in our database"
      #    end
      # end

    def add_movie(array, input)
            array << input
    end

    def pay(array , cost)

      return (array.count-1) * cost
      
    end    



end
