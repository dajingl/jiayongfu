class GoodsController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create]

  def index
    @Goods = Offer.all.order(created_at: :desc)
  end


  def show
    @Goods = Offer.find(params[:offer_id])
  end

end
