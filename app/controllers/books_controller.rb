class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show,:create,:edit,:destroy,:update]
  before_action :correct_user, only: [:edit, :update]


  def top
    @user=current_user
  end

  def index
    @user = current_user
  	@books=Book.all
      @newbook = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def create
    @newbook=Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:success]="You have creatad book successfully."
    redirect_to book_path(@newbook.id)
    else
      @books=Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success]="You have updated book successfully"
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def correct_user
    book=Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end
end