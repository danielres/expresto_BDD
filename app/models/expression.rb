class Expression < ActiveRecord::Base
  validates :body, :author_id, :language_id, :presence => true

  belongs_to :author, :class_name => 'User'
  belongs_to :language


end
