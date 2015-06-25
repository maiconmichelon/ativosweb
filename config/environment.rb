# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Ativos::Application.initialize!

Time::DATE_FORMATS[:default] = "%d/%m/%Y"
