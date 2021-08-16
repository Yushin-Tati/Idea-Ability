class Ability < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :target, dependent: :destroy
  has_many :likes, as: :favorite, dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :title
    validates :text
  end
end
