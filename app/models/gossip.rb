class Gossip < ApplicationRecord
  belongs_to :user #belongs to :author? à voir
  has_many :comments

  validates :title, length: { in: 3..15}
  validates :content, presence: true

def get_gossip
  if commentable_type == 'Gossip'
   commentable

   else
   commentable.get_gossip
   end
   end

end

#  has_many :tag_gossips
  #has_many :tags, through: :tag_gossips
