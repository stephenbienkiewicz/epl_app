class ClubsController  < ApplicationController 
  def index
    @clubs = Club.all
  end
  
  def show
    @club = Club.find_by_id(params[:id])
  end
  
  def new
    @club = Club.new 
  end
  
  def create
    @club = Club.new(club_params)
    
    if @club.save
      flash[:notice] = 'Club was saved successfully'
      redirect_to clubs_path
    else
      flash.now[:error] = 'There was a problem saving this Club'
      render :new
    end
  end
  
  def edit 
    @club = Club.find_by_id(params[:id])  
  end
  
  def update
    @club = Club.find_by_id(params[:id])

    if @club.update(club_params)
      redirect_to club_path(@club), notice: 'Club was updated successfully'    
    else
      flash.now[:error] = "There was an issue updating this Club"
      render :edit
    end
  end
  
  def destroy 
    @club = Club.find_by_id(params[:id]) 

    @club.delete

    redirect_to clubs_path
  end

  private
  
  def club_params
    params.require(:club).permit(:name, :nickname, :manager, :rank, :location_id)
  end

end
