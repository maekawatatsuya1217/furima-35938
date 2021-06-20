class OrdersController < ApplicationController

    before_action :set_item, only: [:index, :create]

    def index
        @donation_address = DonationAddress.new
    end

    def create
        @donation_address = DonationAddress.new(donation_params)
        if @donation_address.valid?
          @donation_address.save
          return redirect_to root_path
        else
          render :'orders/index'
        end
    end

    private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def donation_params
    params.require(:donation_address).permit(:post_number , :area_id , :city , :address , :building_name , :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end