SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    primary.item :music, 'Music', companies_path
    # primary.item :dvds, 'Dvds', dvds_path, :split => true do |dvds|
    #   dvds.item :action, 'Action', dvds_action_path
    #   dvds.item :drama, 'Drama', dvds_drama_path
    # end
    # primary.item :books, 'Books', :icon => ['icon-book', 'icon-white'] do |books|
    #   books.item :fiction, 'Fiction', books_fiction_path
    #   books.item :history, 'History', books_history_path
    # end
    primary.dom_class = 'nav'
    primary.dropdown = true
    primary.split = false
  end
end