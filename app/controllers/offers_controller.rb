class OffersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :create]

  def index
    @Offers = Offer.all.order(created_at: :desc)
  end


  def show
    @Offer = Offer.find(params[:offer_id])
  end

end
