class StoreController < ApplicationController
  layout '_base'
  def index
    render 'store/basic'
  end
end
