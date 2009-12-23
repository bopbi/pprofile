class ContactsController < ApplicationController
  load_and_authorize_resource
  
  def new
    session[:time] = Time.now.to_i
    @email = Configuration.name_equals("email").first
    @contact = Contact.new
  end
  
  def create
    if Time.now.to_i - session[:time] >= 10
      flash[:notice] = "Bot Detected"
      redirect_to :action => "index"
      return false
    end
      
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      flash[:notice] = "Successfully Send Email."
      redirect_to root_url
    else
      flash[:notice] = "Complete Form"
      render :action => 'new'
    end
  end
end
