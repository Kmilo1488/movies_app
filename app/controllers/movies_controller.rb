class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @movies = Movie.all
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def recommended
    @recommended = Movie.all.sample(5)
    render json: @recommended
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    respond_to do |format|
      if @movie.save
        format.html
        format.js
      else
        render :new
      end
    end
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
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
