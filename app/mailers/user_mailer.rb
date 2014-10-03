class UserMailer < ActionMailer::Base
  default from: "admin@rottenmangoes.com"

  def delete_user_email(user)
  	@user = user
  	@url = 
  	mail(to: "kkwoker@hotmail.com", subject: "Your RottenMangoes account has been deleted. Boohoo.")
  end
  helper_method :delete_user_email
end
