class MoviesController < ApplicationController
  def index

    # if params[:title] || params[:director] || params[:duration]
    #   @movies = Movie.search(params[:title], params[:director], params[:duration]).order("created_at DESC")
    # else
    #   @movies = Movie.all.order('created_at DESC')
    # end

    @search = Movie.all
    @search = @search.search(params[:search]) if params[:search]
    @search = @search.runtime(params[:duration]) if !params[:duration]

    @movies = @search.order(created_at: :desc).page(params[:page]).per(10)
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
  		:title, :release_date, :director, :runtime_in_minutes, :description, :image, :remote_image_url
  	)
  end
end
