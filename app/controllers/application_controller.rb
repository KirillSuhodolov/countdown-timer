class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  # before_filter :validate_user

  # private

  # def validate_user() #might need to pass id and current_user
  #   if current_user.id == params[:id]
  #     # continue to current_user url
  #   else
  #       flash[:error] = "Please access one of your own pages"
  #       redirect_to(:back)
  #   end
  # end
end
