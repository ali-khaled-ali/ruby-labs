class ApplicationRecord < ActiveRecord::Base
  include ActiveModel::SerializerSupport
 # include ActiveModel::ArraySerializerSupport
 
  self.abstract_class = true
  
end
