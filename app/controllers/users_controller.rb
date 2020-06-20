class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    redirect_to user_path(current_user) unless params[:id] == current_user.id.to_s
  end

  def update
    current_user.update!(user_params)
    redirect_to user_url(current_user), flash: { success: 'User was successfully updated.' }
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
