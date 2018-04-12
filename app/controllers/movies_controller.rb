class MoviesController < ApplicationController
	# Upcoming movies in the region of USA
	# Accept query ?region=pt-BR for set upcoming region 
	def index
		@region = params[:id].nil? ? 'us' : params[:region]
		@upcoming = Tmdb::Movie.upcoming({region: 'us'})
	end
	
	# Return datas of the movies
	# (name, poster image, genre, overview and release date)
	# GET /movies/:ID
	def show
		@movie = Tmdb::Movie.detail(params[:id])
		@images = Tmdb::Movie.posters(params[:id])
	end

	# For use with infinite scroll
	# Idea: https://medium.com/wolox-driving-innovation/infinite-scrolling-ruby-on-rails-3fcd3bac0f75
	# GET /movies/pagination/?page=
	def pagination
		page = params[:page].nil? ? 1 : params[:page]
		region = params[:id].nil? ? 'us' : params[:region]
		upcoming = Tmdb::Movie.upcoming({page: page, region: region}).results
		render partial: 'movies/movie', collection: upcoming, locals: {movie: upcoming}
	end

	# GET /search/:query
	def search
		@search = Tmdb::Search.movie(params[:query])
	end
end