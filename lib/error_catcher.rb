class ActionController::Base

  def rescue_action_in_public(exception)
    #maybe gather up some data you'd want to put in your error page
  
    case exception
      when ActiveRecord::RecordNotFound
      when ActiveRecord::RecordInvalid
      when ActionController::RoutingError
      when ActionController::UnknownController
      when ActionController::UnknownAction
      when ActionController::MethodNotAllowed
        render :template => "errors/error404", :status => "404"
      else
        render :template => "errors/error500", :status => "500"
    end             
  end

end