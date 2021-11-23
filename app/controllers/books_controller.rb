class BooksController < ApplicationController
  def index
    @books = Book.order(created_at: :asc)
    @book = Book.new
  end

  def create
    @books = Book.order(created_at: :asc)
    @book = Book.new(book_params_2)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      render books_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params_2)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end

  private
  def book_params_1
    params.permit(:title, :body)
  end

  def book_params_2
    params.require(:book).permit(:title, :body)
  end
end
