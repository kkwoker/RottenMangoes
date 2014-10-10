class MoviesController < ApplicationController
  def index

    @search = Movie.all
    @search = @search.search(params[:search]) if params[:search] && !params[:search].empty?
    @search = @search.runtime(params[:duration]) if params[:duration] && !params[:duration].empty?
    @movies = @search.order(release_date: :desc).page(params[:page]).per(10)

  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def create
    uploader = PosterUploader.new
  	@movie = Movie.new(movie_params)
    @movie[:user_id] = session[:user_id]

  	if @movie.save
  		redirect_to root_path, notice: "#{@movie.title} was submitted successfully!}"
  	else
  		render :new
  	end
  end

  def update
  	@movie = Movie.find(params[:id])

  	if @movie.update_attributes(movie_params)
  		redirect_to movies_path(@movie)
  	else
  		render :edit
  	end
  end

  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy
  	redirect_to movies_path
  end



  protected

  def movie_params
  	params.require(:movie).permit(
  		:title, :release_date, :director, :runtime_in_minutes, :review, :image, :watched
  	)
  end
end
