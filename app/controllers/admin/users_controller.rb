class Admin::UsersController < UsersController 

	before_action :find_user, only: [:show, :edit]


	def index
		# session[:user_id] = session[:admin_id]
		session[:user_id] = session[:admin_id].to_i if session[:admin_id]
		session[:admin_id] = nil
		@users = User.all.page(params[:page]).per(5)
	end	

	def show
	end

  def edit
  end

  def update
		@user = User.find(params[:id])

  	if @user.update_attributes(user_params)
  		redirect_to admin_user_path(@user), notice: "Success"
  	else
  		render :edit
  	end
  end

	def find_user 
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :firstname, :lastname, :admin)
	end

	def destroy
		#email user

		@user = User.find(params[:id])
		UserMailer.delete_user_email(@user).deliver
		@user.destroy
		redirect_to admin_users_path
	end

end
