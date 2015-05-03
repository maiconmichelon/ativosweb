module ApplicationHelper

  def t_attribute(name)
    t('activerecord.attributes.' + name)
  end

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

  def title_area(model_class, type)
    h1 = content_tag(:h1,
      t('.title',
          :default => [('helpers.titles.' + type.to_s).to_sym.downcase,
          type.equal?(:show) ? "#{type} #{model_class.model_name}" : "#{model_class.model_name}"],
          :model => model_class.model_name.human.titleize),
      class: "title-page-header");
    content_tag(:div, h1.html_safe, class: "page-header")
  end

  def form_actions(model, params = {})
      all = params[:only].nil? || params[:only].empty?

      html = '';
      if (all || params[:only].include?(:back))
        html += back_button(send((model.class.model_name.name.downcase.pluralize + '_path').to_sym)).html_safe
        html += ' '
      end

      if (all || params[:only].include?(:edit))
        html += edit_button(send(('edit_' + model.class.model_name.name.downcase + '_path').to_sym, model)).html_safe
        html += ' '
      end

      if (all || params[:only].include?(:destroy))
        html += destroy_button(send((model.class.model_name.name.downcase + '_path').to_sym, model)).html_safe
        html += ' '
      end

      content_tag(:div, html.html_safe, class: "form-actions")
  end

  def back_button(path)
    link_to t('.back', :default => t("helpers.links.back")), path, :class => 'btn'
  end

  def edit_button(path)
    link_to t('.edit', :default => t("helpers.links.edit")), path, :class => 'btn'
  end

  def destroy_button(path)
    link_to t('.destroy', :default => t("helpers.links.destroy")), path, :method => 'delete',
                :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },
                :class => 'btn btn-danger'
  end

end
