class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders , dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
    after_create :initialize_session

    def initialize_session
      Cart.create(user_id: self.id)
    end
end
