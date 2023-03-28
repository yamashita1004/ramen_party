class Public::RamensController < ApplicationController
  before_action :authenticate_user!, except: [:top, :index]
  def new
    @ramen = Ramen.new
  end

   def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_id = current_user.id
    if @ramen.save
      flash[:notice] = "You have created ramen successfully."
    redirect_to public_ramens_path
    else
    @ramens = Ramen.all
    @user = current_user
    render new_public_ramen_path
    end
   end


  def index
    #paramsで送られてきたデータの取り出しをしている
    if params[:genre].present?
      @ramens = Ramen.where(genre: params[:genre]).page(params[:page])
    else
      @ramens = Ramen.page(params[:page])
    end
    @user = current_user
  end

  def show
    @ramen = Ramen.find(params[:id])
    @post_comment = PostComment.new
    
  end

  def edit
    @ramen = Ramen.find(params[:id])
  end

  def update
    @ramen=Ramen.find(params[:id])
    if @ramen.update(ramen_params)
      flash[:notice]="You have updated book successfully."
      redirect_to public_ramen_path(@ramen.id)
    else
      render public_ramens_path
    end
  end

  def destroy
    ramen = Ramen.find(params[:id])
    ramen.destroy
    redirect_to public_ramens_path
  end

  private
  def ramen_params
    params.require(:ramen).permit(:name, :introduction, :image, :address,:genre)
  end
  def correct_user
    @ramen = Ramen.find(params[:id])
    @user = @ramen.user
    redirect_to(public_ramens_path) unless @user == current_user
  end
end
