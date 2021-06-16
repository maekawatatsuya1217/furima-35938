class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_change
    belongs_to :area
    belongs_to :days_to_ship

    validates :category_id, presence: true
    validates :status_id, presence: true
    validates :shipping_change_id, presence: true
    validates :area_id, presence: true
    validates :days_to_ship_id, presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_change_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }


end