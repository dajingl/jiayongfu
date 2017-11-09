class GoodsController < HomeController

  def index
    @Goods = Good.all.order(created_at: :desc)
  end


  def show
    @Goods = Good.find(params[:offer_id])
  end

end
