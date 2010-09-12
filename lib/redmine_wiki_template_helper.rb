 
#require_dependency 'redmine'

module RedmineWikiTemplateHelper
  def self.included(base) # :nodoc:
	  puts "x"*1000
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :initial_page_content, :prefix
    end
  end
  
  module InstanceMethods
 
  
    
    # Adds a rates tab to the user administration page
    #~ def initial_page_content_with_prefix(page)
     #~ puts page.inspect.to_s
      #~ tabs = initial_page_content_without_prefix(page)
      #~ tabs +="#{page.inspect.to_s}��sdsdsfadsfasdfadsfsdfsd"  if page.title == "Tt"
      #~ return tabs
    #~ end
    
    def initial_page_content_with_prefix(page)
	    
      if  !page.title.ends_with?("___TEMPLATE___") and page.title.split("___").size > 1
		w = WikiPage.find_by_title(page.title.split("___")[0]+"___TEMPLATE___")
		w.content.text if w!= nil
      else
	       initial_page_content_without_prefix(page)
     end

    end
    
  end
end



Redmine::WikiFormatting::Textile::Helper.send(:include, RedmineWikiTemplateHelper)