class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def check_user
     @user = User.find(params[:id])
     unless current_user.id == @user.id
        redirect_to root_path

     end
  end

  def show
    check_user
    @user = User.find(params[:id])
    @events = Event.where(event_admin: @user)
  end


  def edit
    @user = current_user

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profil édité !"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "Impossible d'éditer le profil :"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end