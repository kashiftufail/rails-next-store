class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
        # binding.pry
        # ffffffff
    posts = Product.all
    render json: posts
  end
end
