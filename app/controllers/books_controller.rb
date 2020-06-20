class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.new book_params
    @book.save!
    redirect_to book_url(@book), flash: { success: 'Book was successfully created.' }
  rescue ActiveRecord::RecordInvalid
    @books = Book.all
    render :index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy!
    redirect_to books_path, flash: { success: 'Book was successfully destroyed.' }
  rescue ActiveRecord::RecordNotDestroyed
    render :show, flash: { danger: 'Failed to destroy the Book.' }
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
