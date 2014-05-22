module ApplicationHelper
  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }") do |builder|
      render(association.to_s.singularize + '_fields', :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", options)
  end

  def back_button components_path
    link_to t('.cancel', :default => t("helpers.links.cancel")), components_path, :class => 'btn'
  end

  def title_area(model_class, type)
    h1 = content_tag(:h1, t('.title', :default => [:'helpers.titles.edit',
      "#{type} #{model_class.model_name}"], :model => model_class.model_name.human.titleize), class: "new-edit-header");
    content_tag(:div, h1.html_safe, class: "page-header")
  end

end
