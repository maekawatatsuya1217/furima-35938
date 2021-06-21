class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Destination.create(history_id: history.id, post_number: post_number, area_id: area_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number)
  end
end
