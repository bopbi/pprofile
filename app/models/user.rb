class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  acts_as_authentic
  
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
  
end
