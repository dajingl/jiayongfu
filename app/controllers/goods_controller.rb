class GoodsController < BaseController

  def index
    @Goods =  @company.goods.order(created_at: :desc)
  end


  def show
    @Goods = Good.find(params[:id])
  end

end
