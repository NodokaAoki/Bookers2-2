class UsersController < ApplicationController
  def index
    @user = current_user
    @users=User.all
      @newbook = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
      @newbook=Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:success]="You have updated user successfully"
  	redirect_to user_path(@user.id)
  end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
