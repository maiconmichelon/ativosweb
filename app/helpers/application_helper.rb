module ApplicationHelper

  def avatar_url(user, options = {})  
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    url = "http://gravatar.com/avatar/#{gravatar_id}.png" 
    if options[:size]
      url += "?s=" + options[:size].to_s
    end
    
    return url
  end 

  def t_attribute(attribute)
    t("activerecord.attributes.#{attribute}")
  end

  def t_model(model)
    t("activerecord.models.#{model}")
  end

  def t_and_pluralize_model(model)
    t_model(model).pluralize
  end

  def t_title_new(model_name)
    t('helpers.titles.new', model: t('activerecord.models.' + model_name))
  end

  def t_title_edit(model_name)
    t('helpers.titles.edit', model: t('activerecord.models.' + model_name))
  end

  def link_to_remove_fields(name, f, options = {})
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end

  def link_to_add_fields(name, f, association, options = {})
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{ association }", :onsubmit => "return $(this.)validate();") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "add_fields(this, \"#{ association }\", \"#{ escape_javascript(fields) }\")", options)
  end

  def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end

  def awesome_link(awesome_image, link_name, link, html_options = {})
    link_to(link, html_options) do 
      fa_icon(awesome_image) + ("<span> " + link_name + "</span>").html_safe
    end
  end

end
