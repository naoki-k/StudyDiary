class SessionsController < ApplicationController
  def new
  end

  def create
    if (@user = User.find_by(email: params[:signin][:email].downcase))
      sign_in @user
    end
  end
end
