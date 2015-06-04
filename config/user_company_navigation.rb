SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    
    primary.item :fixture, t('layout.fixtures') do |fixture|
      fixture.item :fixture, t('layout.fixtures'), company_fixtures_path(current_company)
      fixture.item :component, t('layout.components'), company_components_path(current_company)
      fixture.item :maintenance, t('layout.maintenances'), company_maintenances_path(current_company)
      fixture.item :type, t('layout.types'), company_types_path(current_company)
      fixture.item :budget, t('layout.budgets'), company_budgets_path(current_company)

      fixture.dom_class = 'submenu'
    end
    
    primary.item :people, t('layout.people'), :icon => ['icon-book', 'icon-white'] do |people|
      people.item :people, t('layout.people'), company_people_path(current_company)
      people.item :groups, t('layout.groups'), company_groups_path(current_company)
      people.item :providers, t('layout.providers'), company_providers_path(current_company)

      people.dom_class = 'submenu'
    end

    primary.dom_id = 'dashboard-menu'
    primary.dropdown = false
  end
end
