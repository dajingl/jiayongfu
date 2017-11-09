class SettlementJob < ApplicationJob
  queue_as :default

  def perform(*args)
   p '123-------------------'
  end
end
