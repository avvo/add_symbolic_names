module AddSymbolicNames

  module ClassMethods
    
    def add_symbolic_names(opts = {})
      symbolic_name_attr = opts[:symbolic_name_attrib] || :symbolic_name
      value_attr = opts[:value_attrib] || :id
      
      find(:all).each do |r|
       class_eval %{
        if !defined? #{r.send(symbolic_name_attr)}
         #{r.send(symbolic_name_attr)} =
         #{r.send(value_attr)}
        end
       }
      end
    end
    
  end
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
end

ActiveRecord::Base.class_eval do 
  include AddSymbolicNames
end
