class DosesController < ApplicationController
  
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    # @dose = Dose.create(description: params["dose"]["description"], cocktail_id: params["cocktail_id"], ingredient_id: params["dose"]["ingredient_id"])
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  
  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  
  
end
