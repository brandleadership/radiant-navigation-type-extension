# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationTypeExtension < Radiant::Extension
  version "1.0"
  description "Helps to alocate pages to a naviagation"
  url "http://www.screenconcept.ch"
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :navigation_types
    end
  end
  
  def activate
    admin.tabs.add "Navigation Type", "/admin/navigation_types", :after => "Layouts", :visibility => [:all]
    admin.page.edit.add :parts_bottom, "navigationType", :after  => 'edit_layout_and_type' 
    Page.send :include,  NavigationTypeTags
  end
  
  def deactivate
    admin.tabs.remove "Navigation Type"
  end
  
end