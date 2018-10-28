class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :description, length: { in: 1..500 }
  def is_discounted?
    price < 10
  end
  def tax
    price * 0.09
  end
  def total
    final = price.to_i + tax
    return final
  end
  def supplier
    Supplier.find_by(id: supplier_id)
  end
  has_many :images
  has_many :orders
  has_many :category_products
end
