class Language < ActiveRecord::Base
  validates :code, :name, :presence => true
  has_many :expressions
end
