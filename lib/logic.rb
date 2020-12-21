require 'date'

class Search_movie

    def premiere(release_date)
        date_now = DateTime.now
        
        prueba = DateTime.parse(release_date) >> 1
        
        if date_now > prueba
            return "No es de estreno" 
        else
            return 'Pelicula de Estreno'
        end
    end

    def search_title(name)
        Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
        
          search = Tmdb::Search.movie(name, language: 'en').results
          premiere(search[0]['release_date'])
          
          if search[0] != nil 

          return search[0]['original_title'], search[0]['overview']
          else
            return "We'are sorry it's not in our database "
          end
        end
        
        def search_actor(name)
            Tmdb::Api.key('2ed8d3de86cb00cde812d0ade32ea313')
        
            search = Tmdb::Search.movie(name, language: 'en').results

            premiere(search[0]['release_date'])

            if search[0] != nil 

            return search[0]['original_title'], search[0]['overview']
            else
              return "We'are sorry it's not in our database "
            end
        end

end


#busca = Search_movie.new

#busca.premiere('2020-12-11')