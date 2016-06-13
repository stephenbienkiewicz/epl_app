class StatusesController  < ApplicationController 
  def index
    @statuses = Status.all
  end
  
  def show
    @status = Status.find_by_id(params[:id])
  end
  
  def new
    @status = Status.new 
  end
  
  def create
    @status = Status.new(status_params)
    
    if @status.save
      flash[:notice] = 'Status was saved successfully'
      redirect_to statuses_path
    else
      flash.now[:error] = 'There was a problem saving this Status'
      render :new
    end
  end
  
  def edit 
    @status = Status.find_by_id(params[:id])  
  end
  
  def update
    @status = Status.find_by_id(params[:id])

    if @status.update(status_params)
      redirect_to statuses_path, notice: 'Status was updated successfully'    
    else
      flash.now[:error] = "There was an issue updating this Status"
      render :edit
    end
  end
  
  def destroy 
    @status = Status.find_by_id(params[:id]) 

    @status.delete

    redirect_to statuses_path
  end

  private
  
  def status_params
    params.require(:status).permit(:name)
  end

end
