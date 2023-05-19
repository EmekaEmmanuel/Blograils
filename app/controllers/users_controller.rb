class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users, status: 200 }
    end
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
    else
      @user = User.find_by(id: params[:id])
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'User not found' unless @user }
        format.json { render json: @user, status: 200 }
      end
    end
  end
end
