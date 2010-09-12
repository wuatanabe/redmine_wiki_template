module RedmineWikiTemplateExtendedModel
  def self.included(base) # :nodoc:
  # puts "k"*100
  # puts "base="+base.inspect.to_s   
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :save, :rename
    end    
  end
  
  module InstanceMethods

	 
        def save_with_rename
 
		
	   if self.title.starts_with?("DS__TEMPLATE__") and !self.title.ends_with?("DS__TEMPLATE__") 
		self.title="ddddddd"

	   end
	save_without_rename	
	end
	
  end
end
ActiveRecord::WikiPage.send(:include, RedmineWikiTemplateExtendedModel)