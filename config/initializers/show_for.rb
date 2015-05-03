# Use this setup block to configure all options available in ShowFor.
ShowFor.setup do |config|
  # The tag which wraps each attribute/association call. Default is :p.
  config.wrapper_tag = :dl
  # The tag used to wrap each label. Default is :strong.
  config.label_tag = :dt
  # The tag used to wrap each content (value). Default is nil.
  # config.content_tag = :dd

  config.label_class = nil
end
