class Expression < ActiveRecord::Base
  validates :body, :author_id, :language_id, :presence => true

  belongs_to :author, :class_name => 'User'
  belongs_to :language

  scope :recent, lambda{ |qty|    order('created_at DESC').limit(qty) }
  scope :in,     lambda{ |locale| where(:language_id => Language.find_by_code(locale).id) }

end
