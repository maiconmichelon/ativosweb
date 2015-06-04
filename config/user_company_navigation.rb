SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    
    primary.item :fixture, t('layout.fixtures') do |dvds|
      dvds.item :fixture, t('layout.fixtures'), company_fixtures_path(current_company)
      dvds.item :component, t('layout.components'), company_components_path(current_company)
      dvds.item :maintenance, t('layout.maintenances'), company_maintenances_path(current_company)
      dvds.item :type, t('layout.types'), company_types_path(current_company)
      dvds.item :budget, t('layout.budgets'), company_budgets_path(current_company)
    end
    
    primary.item :people, t('layout.people'), :icon => ['icon-book', 'icon-white'] do |books|
      books.item :people, t('layout.people'), company_people_path(current_company)
      books.item :groups, t('layout.groups'), company_groups_path(current_company)
      books.item :providers, t('layout.providers'), company_providers_path(current_company)
    end

    primary.dom_class = 'nav'
    primary.dropdown = true
    primary.split = false
  end
end
