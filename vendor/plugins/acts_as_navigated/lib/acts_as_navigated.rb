module ActsAsNavigated
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    
    def acts_as_navigated
      send :include, InstanceMethods
    end
    
  end

  module InstanceMethods
    def lower_item
      self.class.id_lt(self.id).last
    end

    def higher_item
     self.class.id_gt(self.id).first
    end

    def first?
     self.class.id_lt(self.id).last == nil
    end

    def last?
     self.class.id_gt(self.id).first == nil
    end
  end
   
end

ActiveRecord::Base.send :include, ActsAsNavigated
