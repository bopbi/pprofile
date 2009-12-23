class News < ActiveRecord::Base
  attr_accessible :title, :content
  
  acts_as_list :column => "id"
end
