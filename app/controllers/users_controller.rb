class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users=User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def update 
      if @user.update(user_params)
          redirect_to user_path(current_user), notice: "User update"
      else
          flash.now[:alert] = @user.errors.full_messages[0]
          render "edit"
      end
  end
  
  def created
    @user = User.new(user_params)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  #######
  private
  #######

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description)
  end

end