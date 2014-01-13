class TypeComponent < ActiveRecord::Base
  belongs_to :type
  belongs_to :component
end
