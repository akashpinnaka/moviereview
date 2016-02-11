class MoviesController < ApplicationController

  before_action :find_movie, :only => [:show, :edit, :update, :upvote, :downvote]
  def index
  	@movies = Movie.all.order('created_at DESC')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      Vote.create(vote_params, movie_id: @movie.id)
      redirect_to movies_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @movie.update movie_params
      redirect_to movies_path
    else
      render "edit"
    end
  end

  def upvote
    @movie.vote.upvotes += 1
    redirect_to movies_path
  end

  def downvote
    @movie.vote.downvotes += 1
    redirect_to movies_path
  end



  private

  def movie_params
    params.require(:movie).permit(:title, :description, :thumbnail)    
  end

  def vote_params
    params.require(:vote).permit(:upvotes, :downvotes)    
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end