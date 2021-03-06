class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def show
	@user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to seats_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to seats_path, :notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
end