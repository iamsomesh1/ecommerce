class Product < ApplicationRecord
    
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  belongs_to :user
	has_one_attached :image

	validates :product_name, presence: true
 	validates :description, presence: true, length: { minimum: 10 }
 	validates :price, presence: true

  default_scope { order(created_at: :desc)}
    
 	 
        scope :between_range, -> (min,max){
            where("price >= ? AND price <= ?", min,max)
        }
    
end
