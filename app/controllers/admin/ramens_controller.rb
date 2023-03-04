class Admin::RamensController < ApplicationController
  def index
    @ramens = Ramen.all

  end

  def show
    @ramen = Ramen.find(params[:id])
  end

  def edit

  end
  def destroy
      ramen = Ramen.find(params[:id])
      ramen.destroy
      redirect_to admin_ramens_path
  end
  def destroy_all
    current_admin.ramens.destroy_all
    redirect_to admin_ramens_path, notice: '。'
  end
end
