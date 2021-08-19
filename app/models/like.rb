class Like < ApplicationRecord
  belongs_to :user
  belongs_to :, polymorphic: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
