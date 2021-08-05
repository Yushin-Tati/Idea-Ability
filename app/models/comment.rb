class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true, dependent: :destroy
  has_many :comments, as: :target

  with_options presence: true do
    validates :text
  end

end
