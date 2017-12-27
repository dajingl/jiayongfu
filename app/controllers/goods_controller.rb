class GoodsController < BaseController

  def index
    @Goods =  @company.goods.order(created_at: :desc)
  end


  def show
    @Goods = Good.find(params[:good_id])
  end

end
