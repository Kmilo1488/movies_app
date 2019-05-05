class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def recommended
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
