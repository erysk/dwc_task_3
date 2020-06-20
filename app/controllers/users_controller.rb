class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit; end

  def update
    current_user.update!(user_params)
    redirect_to user_path(current_user)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
