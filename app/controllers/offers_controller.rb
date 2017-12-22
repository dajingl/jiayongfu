class OffersController < BaseController

  def index
    @Offers = Offer.all.order(created_at: :desc)
  end


  def show
    @Offer = Offer.find(params[:offer_id])
  end

end
