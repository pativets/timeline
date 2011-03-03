class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def destroy
	User.find(params[:id]).destroy
    flash[:success] = "The user has been deleted."
    redirect_to users_path
  end
  
  def new
	@title = "Subscriber sign up"
	@user = User.new
  end
  
  def index
	@title = "All Users"
	@users = User.paginate(:page => params[:page])
  end
  
  def show
	@user = User.find(params[:id])
	@events = @user.events.paginate(:page => params[:page])
	@title = @user.name
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
		sign_in @user
		flash[:success] = "Welcome to the Subscriber's Squad!"
		UserMailer.welcome_email(@user).deliver      #sending e-mail to user
		redirect_to @user
	else
		@title = "Subscriber sign up"
		render 'new'
	end
  end
  
  def edit
    @title = "Edit User"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  private
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end
end

