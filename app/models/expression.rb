class Expression < ActiveRecord::Base
  before_save :clean_and_format_body
  validates :body, :meaning, :author_id, :created_by_author, :language_id, :presence => true

#  SOURCE_TYPES = [:me, :someone, :fiction, :celebrity, :private_joke, :internet, :forgotten, :other]
#   validates_inclusion_of :source_type, :in => SOURCE_TYPES

  belongs_to :author, :class_name => 'User'
  belongs_to :language
  default_scope order('created_at DESC')
  scope :recent, lambda{ |qty=nil|order('created_at DESC').limit(qty) }
  scope :in,     lambda{ |locale| where(:language_id => Language.find_by_code(locale).id) }

  def to_s
    body
  end

private

  def clean_and_format_body
    self.body = self.body.strip.squeeze(' ')
    self.body = self.body + '.' unless self.body.last == '.'
    self.body = self.body.sub(/^(\w)/) {|s| s.upcase_international}
  end



end
