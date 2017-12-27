class HomeController < BaseController
 def index
   @posters = @company.posters.order(rank: :desc)
 end
end
