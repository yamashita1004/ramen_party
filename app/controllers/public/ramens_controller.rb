class Public::RamensController < ApplicationController
  def new
    @ramen = Ramen.new
  end

   def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_id = current_user.id
    if @ramen.save
      flash[:notice] = "You have created ramen successfully."
    redirect_to ramens_path
    else
    @ramens = Ramen.all
    @user = current_user
    render new_ramen_path
    end
   end


  def index
    @ramens = Ramen.all
     @user = current_user
  end

  def show
    @ramen = Ramen.find(params[:id])
  end

  def edit
    @ramen = Ramen.find(params[:id])
  end

  def update
    @ramen=Ramen.find(params[:id])
    if @ramen.update(ramen_params)
      flash[:notice]="You have updated book successfully."
      redirect_to ramen_path(@ramen.id)
    else
      render ramens_path
    end
  end

  def destroy
    ramen = Ramen.find(params[:id])
    ramen.destroy
    redirect_to ramens_path
  end

  private
  def ramen_params
    params.require(:ramen).permit(:name, :introduction, :image, :address)
  end
  def correct_user
    @ramen = Ramen.find(params[:id])
    @user = @ramen.user
    redirect_to(books_path) unless @user == current_user
  end
end
