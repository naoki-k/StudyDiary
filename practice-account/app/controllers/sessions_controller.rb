class SessionsController < ApplicationController
  protect_from_forgery :except => [:create]
  include SessionsHelper
  def new
  end

  def create
    @user = User.find_by(email: params[:signin][:email].downcase)
    if @user && @user.authenticate(params[:signin][:password])
      sign_in @user
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email or password...'
      render 'new'
    end
  end

  def destroy
    if signed_in?
      sign_out
      flash.now[:success] = "Goodbye!"
      render 'top/index'
    end
  end
end
