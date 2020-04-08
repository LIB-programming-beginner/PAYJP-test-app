class PaysController < ApplicationController

 require 'payjp'

 def index
 end

 def new
 end

 def create
  purchase
  redirect_to "pays#show"
 end

  

  def purchase
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 1000, 
      card: params['payjp-token'], 
      currency: 'jpy'
    )
  end
end