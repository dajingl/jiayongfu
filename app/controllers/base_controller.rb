class BaseController < ApplicationController
  before_action :set_current_scope

  def set_current_scope
    @company = Company.find(params[:id]=1)
  end
end
