class ContactController < ApplicationController
  def index
    session[:time] = Time.now.to_i
    @email = Configuration.name_equals("email").first
  end

  def contact
    if Time.now.to_i - session[:time] >= 10
      flash[:notice] = "Bot Detected"
      redirect_to :action => "index"
      return false
    end
    
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      Notifications.deliver_contact(@contact)
      flash[:notice] = "Message Sent Success"
    else
      flash[:notice] = "Complete Form"
    end
    redirect_to :action => "index"
  end

end
