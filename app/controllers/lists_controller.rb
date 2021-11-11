class ListsController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(movie_params)
    @movies.save
    if @movies.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster, :url, :rating)
  end
end
