class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :price, type: String
  field :created_at, type: Time

  has_attachment  :image

  belongs_to :user
  belongs_to :category, touch: true

  default_scope -> { order('updated_at ASC') }
end