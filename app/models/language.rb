class Language < ActiveRecord::Base
  validates :code, :name, :presence => true
end
