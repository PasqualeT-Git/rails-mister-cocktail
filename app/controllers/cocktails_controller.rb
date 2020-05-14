class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  
  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end
  
end
