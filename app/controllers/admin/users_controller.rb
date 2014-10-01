class Admin::UsersController < UsersController 

	before_action :find_user, only: [:show, :edit]


	def index
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
		  	params.require(:user).permit(:email, :firstname, :lastname)
	end

end
