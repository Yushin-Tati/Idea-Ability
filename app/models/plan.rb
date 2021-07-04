class Plan < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :target
  attachment :image
  
  with_options presence: true do
    validates :title
    validates :text
  end
end
