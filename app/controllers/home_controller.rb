class HomeController < ApplicationController
  def index
    @company = Company.find(params[:id]=1)

    @posters = Poster.all.order(rank: :desc)
  end
end
