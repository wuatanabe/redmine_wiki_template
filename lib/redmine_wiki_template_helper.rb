 

module RedmineWikiTemplateHelper
  def self.included(base) 
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :initial_page_content, :prefix
    end
  end
  
  module InstanceMethods
 
    
    def initial_page_content_with_prefix(page)
      template_identifier ="___TEMPLATE___"
      w = WikiPage.find_by_title(page.title.split(template_identifier)[0]+template_identifier)      
      if  !page.title.ends_with?(template_identifier) and page.title.split("___").size > 1 and w != nil and w.visible?
		w.content.text 
      else
	       initial_page_content_without_prefix(page)
     end

    end
    
  end
end



Redmine::WikiFormatting::Textile::Helper.send(:include, RedmineWikiTemplateHelper)
