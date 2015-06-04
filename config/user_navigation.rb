SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :new_company, t('layout.new_company'), new_company_path
    
    primary.dropdown = false
    primary.dom_id = 'dashboard-menu'
  end
end