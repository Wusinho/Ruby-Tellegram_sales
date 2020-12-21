require 'date'
require 'themoviedb-api'


class Search_movie

    def premiere(release_date)
        date_now = DateTime.now
        
        prueba = DateTime.parse(release_date) >> 1
        
        date_now > prueba ? 'No es de estreno' : 'Pelicula de Estreno'
       
    end

    def search_title(name)
        Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
        
          search = Tmdb::Search.movie(name, language: 'en').results

          if search[0] != nil 

          return search[0]['original_title'], search[0]['overview']

          else

            return "We'are sorry it's not in our database "

          end
    end
        
      def search_actor(name)
          Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
              
          search = Tmdb::Search.person(name).results 
        
         if search[0] != nil
          array = search[0]['known_for']
          array.each_with_index {|ele, index| puts array[index]['original_title'] }
            
         else
           puts  "We'are sorry it's not in our database"
         end
      end

    def add(array, *input)

      array << [input]

    end




end


busca = Search_movie.new

#busca.premiere('2020-12-11')
#print busca.search_title('dsadassaf')
busca.search_actor('dsadsads ')
