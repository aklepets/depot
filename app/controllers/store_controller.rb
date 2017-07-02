class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
    if session[:counter].nil?
      session[:counter]=1
    else
      session[:counter]+=1
    end
    if session[:counter] > 5
      flash[:notice] = "Bro, you've been here #{session[:counter]} #{'time'.pluralize(session[:counter])}"
    end
  end
end
