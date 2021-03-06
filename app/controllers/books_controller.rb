class BooksController < ApplicationController

  before_action :authenticate_user!


  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    @book_comment = BookComment.new
    @book_comments = @books.book_comments
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      flash[:notice] = ' errors prohibited this obj from being saved:'
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:succes]= "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:notice]= ' errors prohibited this obj from being saved:'
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
