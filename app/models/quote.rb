class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: Array

  validates_presence_of :quote,  :author, :author_about, :tags
  validates_uniqueness_of :quote
end
