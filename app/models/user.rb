class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plans
  has_many :abilities
  has_many :products
  attachment :image
  acts_as_followable
  acts_as_follower
end
