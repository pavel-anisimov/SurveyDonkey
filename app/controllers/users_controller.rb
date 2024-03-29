class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login @user #logining the user after the registration
      flash[:success] = 'Thanks for registering!'
      redirect_to root_url
    else
      render 'new'   #refresh new page with error messages
    end

  end
end
