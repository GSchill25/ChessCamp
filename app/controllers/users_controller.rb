class UsersController < ApplicationController
	before_action :check_login, only: [:edit, :update]
	before_action :set_user, only: [:edit, :update]

	def new
		@user=User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to(home_path, :notice => 'User was successfully created.')
	    else
	      render :action => "new"
	    end
	end

	def update
	    if @user.update(user_params)
	      redirect_to(home_path, :notice => 'User was successfully updated.')
	    else
	      render :action => "edit"
	    end
	end



	private
	def set_user
      @user = User.find(params[:id])
    end

  	def user_params
    	params.require(:user).permit(:username, :role, :password, :password_confirmation, :instructor_id, :active)
  	end



end