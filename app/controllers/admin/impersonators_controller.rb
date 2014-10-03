class Admin::ImpersonatorsController < ApplicationController

	def create
    if params[:ghost_id]
      user = User.find(params[:ghost_id])

      session[:admin_id] = params[:admin_id]
      session[:user_id] = user.id
      redirect_to movies_path, notice: "You are an admin, logged in as #{user.firstname}"
    end
	end    

end
