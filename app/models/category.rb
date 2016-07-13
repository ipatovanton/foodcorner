class Category
  include Mongoid::Document

  field :title, type: String
  field :url, type: String
  field :_id, type: String, default: ->{ url }
  has_many :entries
  belongs_to :user

  default_scope -> { order('updated_at DESC') }

end