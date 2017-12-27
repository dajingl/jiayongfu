class HomeController < BaseController
 def index
   @posters = Poster.all.order(rank: :desc)
 end
end
