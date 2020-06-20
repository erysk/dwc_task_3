class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(user_params)
    redirect_to user_path(current_user)
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
