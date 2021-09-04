class Like < ApplicationRecord
  belongs_to :user
  belongs_to :favorite, polymorphic: true
end
