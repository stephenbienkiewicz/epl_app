class ClubsController  < ApplicationController 
  before_action :find_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @clubs = Club.all
  end
  
  def show
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
  end
  
  def update
    if @club.update(club_params)
      redirect_to club_path(@club), notice: 'Club was updated successfully'    
    else
      flash.now[:error] = "There was an issue updating this Club"
      render :edit
    end
  end
  
  def destroy  
    @club.delete

    redirect_to clubs_path
  end

  private
  
  def find_club
    @club = Club.find_by_id(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :nickname, :manager, :rank, :location_id, :status_ids => [])
  end

end
