class Ability < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :target
  attachment :image
end
