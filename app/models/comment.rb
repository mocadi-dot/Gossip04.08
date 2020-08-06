class Comment < ApplicationRecord
  belongs_to :User,
  
  has_many :comments,

  validates :content, presence: true

  def get_gossip
    if commentable_type == 'Gossip'
      commentable
    else
      commentable.get_gossip
    end
  end
end
