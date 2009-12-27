class Image < ActiveRecord::Base
  attr_accessible :name, :photo
  has_attached_file :photo, :styles => { :small => "150x150>" , :medium => "300x300>"},
                    :url => "/assets/images/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"
end
