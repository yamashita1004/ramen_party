class Public::RamensController < ApplicationController
  def new
    @ramen = Ramen.new
  end
  def create
    ramen = Ramen.new(ramen_params)
    ramen.save
    redirect_to ramens_path
  end


  def index
  end

  def show
  end

  def edit
  end
  private
  def ramen_params
    params.require(:ramen).permit(:name, :introduction, :image, :addresses)
  end
end
