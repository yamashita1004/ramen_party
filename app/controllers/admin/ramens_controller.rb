class Admin::RamensController < ApplicationController
  def index
    @ramens = Ramen.all

  end

  def show
    @ramen = Ramen.find(params[:id])
  end

  def edit
  end
end
