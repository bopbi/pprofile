# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  rescue_from CanCan::AccessDenied do |exception|
    render :template => "errors/error404", :status => "404"
  end
  
  def rescue_404
    rescue_action_in_public(ActionController::RoutingError)
  end
  
  def rescue_action_in_public(exception)
    #maybe gather up some data you'd want to put in your error page
  
    case exception
      when ActionController::InvalidAuthenticityToken
      when ArgumentError
      when SyntaxError
        render :template => "errors/error404", :status => "404"
      else
        render :template => "errors/error500", :status => "500"
    end          
  end

  def local_request?
    return false
  end
  
end
