SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :new_company, t('layout.new_company'), new_company_path
    # end
    primary.dom_class = 'nav'
    primary.dropdown = true
    primary.split = false
  end
end