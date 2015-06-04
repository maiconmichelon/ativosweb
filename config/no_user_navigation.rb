SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    
    primary.dom_class = 'dashboard-menu'
    primary.dropdown = false
    primary.split = false
  end
end