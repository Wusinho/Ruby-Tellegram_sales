require 'date'
require 'themoviedb-api'


class Search_movie

  def initialize
    @token_tmdb = '2ed8d3de86cb00cde812d0ade32ea313'
    @n_premier = 0
    @cost_premier = 1.5
    @n_regular = 0
    @cost_regular = 1
    @search = []  
    @Movie_details = []
    
  end

   

    def search_title(name)
        Tmdb::Api.key(@token_tmdb)
        
          @search = Tmdb::Search.movie(name, language: 'en').results

          if @search[0] != nil 
            @Movie_details = @search[0]
           
            return @Movie_details['original_title']

          else

            return "We'are sorry it's not in our database "

          end
    end
        

     def premiere
      
     
        date_now = DateTime.now
      
        novie_release = (DateTime.parse(@Movie_details['release_date'])) >> 1
      
        date_now > novie_release ? 'Regular' : 'Premier'
     
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

    def pay

      return (@n_premier*@cost_premier )+ (@n_regular*@cost_regular)
      
    end    

    def empty
      @n_premier = 0
      @n_egular = 0
    end

end


#nueva = Search_movie.new

#nueva.search_title('terminator')
#puts nueva.premiere#('2020-12-20')
#puts nueva.movie_synopxis