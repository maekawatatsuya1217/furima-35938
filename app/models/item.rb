class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_change
    belongs_to :area
    belongs_to :days_to_ship

    with_options presence: true do
      validates :category_id
      validates :status_id
      validates :shipping_change_id
      validates :area_id
      validates :days_to_ship_id
      validates :image
      validates :name
      validates :price
      validates :description
      validates :price
    end

    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_change_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    

end