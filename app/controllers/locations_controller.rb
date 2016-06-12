class LocationsController  < ApplicationController 
  def index
    @locations = Location.all
  end
  
  def show
    @location = Location.find_by_id(params[:id])
  end
  
  def new
    @location = Location.new 
  end
  
  def create
    @location = Location.new(location_params)
    
    if @location.save
      flash[:notice] = 'Location was saved successfully'
      redirect_to locations_path
    else
      flash.now[:error] = 'There was a problem saving this Location'
      render :new
    end
  end
  
  def edit 
    @location = Location.find_by_id(params[:id])  
  end
  
  def update
    @location = Location.find_by_id(params[:id])

    if @location.update(location_params)
      redirect_to locations_path, notice: 'Location was updated successfully'    
    else
      flash.now[:error] = "There was an issue updating this Location"
      render :edit
    end
  end
  
  def destroy 
    @location = Location.find_by_id(params[:id]) 

    @location.delete

    redirect_to locations_path
  end

  private
  
  def location_params
    params.require(:location).permit(:name)
  end

end
