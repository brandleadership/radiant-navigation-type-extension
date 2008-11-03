# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationTypeExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/navigation_type"
  
  define_routes do |map|
     map.connect 'admin/navigation_type/:action', :controller => 'admin/navigation_type'
   end
  
  def activate
    admin.tabs.add "Navigation Type", "/admin/navigation_type", :after => "Layouts", :visibility => [:all]
    admin.page.edit.add :parts_bottom, "navigationType", :after  => 'edit_layout_and_type' 
    Page.send :include,  NavigationTypeTags
  end
  
  def deactivate
    # admin.tabs.remove "Navigation Type"
  end
  
end