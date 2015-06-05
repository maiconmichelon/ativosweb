SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :companies, awesome_link('building-o', t('layout.companies'), companies_path)
    primary.item :new_company, awesome_link('plus', t('layout.new_company'), new_company_path)

    primary.dom_id = 'dashboard-menu'
    primary.dropdown = false
  end
end
