class SessionsController < ApplicationController
  def new
    @session = Session.new
  end
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Successfully Logged In."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    flash[:notice] = "Successfully Logged Out."
    redirect_to root_url
  end
end
