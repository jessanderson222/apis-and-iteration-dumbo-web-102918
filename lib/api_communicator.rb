require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  #binding.pry
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.
  # iterate over the response hash to find the collection of `films` for the given
  #   `character` *done*
    # collect those film API urls, *done*
    #make a web request to each URL to get the info *done*
  found_character = response_hash["results"].find { |character_hash| character_hash["name"].downcase == character}
    film_array = found_character["films"]
    film_array_2 = film_array.map do |film|
      JSON.parse(RestClient.get("#{film}"))
    end


    #binding.pry
  #turn film_array_2 into an array of hashes *done
  #film_hash = JSON.parse(film_array_2) *done
  #puts film_hash *done



  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_hash)
  films_hash.each do |movie_hash|
    puts movie_hash["title"]
    puts movie_hash["release date"]
    puts "Directed by #{movie_hash["director"]}"
  end
#binding.pry
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
   films_array = get_character_movies_from_api(character)
   print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
