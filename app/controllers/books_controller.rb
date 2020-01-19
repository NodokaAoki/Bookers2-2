class BooksController < ApplicationController

  def top
    @user=current_user
  end

  def index
  	@books=Book.all
	  @newbook=Book.new
    @user = current_user
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

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @newbook=Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end