class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies.watched.reverse
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
  	else
  		render :new
  	end
  end

  def index
    searches = params["search"].split(" ")
    users = User.all
    searches.each do |search|
      users = users.search(search)
    end
    @users_found = users
    # @users_found = {data: users}.to_json
    # respond_to do |format|
      # format.json { render json: @users_found }
     # end
  end


  protected

  def user_params
  	params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
end
