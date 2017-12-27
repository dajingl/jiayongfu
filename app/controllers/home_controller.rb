class HomeController < BaseController
 def show
   @posters = @company.posters.order(rank: :desc)
 end
end
