class News < ActiveRecord::Base
  attr_accessible :title, :content
  
  def lower_item
   News.id_lt(self.id).first
  end
  
  def higher_item
   News.id_gt(self.id).first
  end
  
  def first?
    News.id_lt(self.id).first == nil
  end
  
  def last?
    News.id_gt(self.id).first == nil
  end
  
end
