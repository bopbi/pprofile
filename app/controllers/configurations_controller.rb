class ConfigurationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @configurations = Configuration.all
  end
  
  def show
    @configuration = Configuration.find(params[:id])
  end
  
  def new
    @configuration = Configuration.new
  end
  
  def create
    @configuration = Configuration.new(params[:configuration])
    if @configuration.save
      flash[:notice] = "Successfully created configuration."
      redirect_to @configuration
    else
      render :action => 'new'
    end
  end
  
  def edit
    @configuration = Configuration.find(params[:id])
  end
  
  def update
    @configuration = Configuration.find(params[:id])
    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = "Successfully updated configuration."
      redirect_to @configuration
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @configuration = Configuration.find(params[:id])
    @configuration.destroy
    flash[:notice] = "Successfully destroyed configuration."
    redirect_to configurations_url
  end
end
