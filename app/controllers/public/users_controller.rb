class Public::UsersController < ApplicationController
  def index
    @ramens = Ramen.all
    @users = User.all
    
  end
   def create


    @user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to public_user_path(@user.id)
   end

  def show
     @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to  public_user_path(@user.id)
  end
  def quit
   @user = current_user
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to ramen_path
  end
  private
  def user_params
    params.require(:user).permit(:name,:introduction, :image)
  end

end
