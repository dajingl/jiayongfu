class OffersController < BaseController

  def index
    @Offers = @company.offers.order(created_at: :desc)
  end


  def show
    @Offer = Offer.find(params[:id])
  end

end
