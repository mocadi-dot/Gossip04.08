class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  has_many :comments


  validates :title, length: { in: 3..15}
  validates :content, presence: true
end
