class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
        # binding.pry
    posts = Post.all
    render json: posts
  end
end
