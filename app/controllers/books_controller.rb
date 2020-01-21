class BooksController < ApplicationController

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
    newbook=Book.new(book_params)
    newbook.user_id = current_user.id
    if newbook.save
      flash[:success]="You have creatad book successfully."
    redirect_to book_path(newbook.id)
    else
      @books=Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end