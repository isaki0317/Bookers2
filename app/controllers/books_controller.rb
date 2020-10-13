class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @post_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @post_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @user != current_user
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :edit
    end
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      redirect_to book_path(@post_book)
    else
      render :show
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
