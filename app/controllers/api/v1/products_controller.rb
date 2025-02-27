class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!


    def index
      products1 = Product.all
      # products = Product.includes(:images).all
  
      # Prepare the response by attaching image URLs to each product
      products = products1.map do |product|
        {
          id: product.id,
          name: product.name,
          price: product.price,
          # Generate full URLs for all images attached to this product
          images: product.images.map { |image| rails_blob_url(image) }
        }
      end
       
      # Render products with their images
      render json: products
    end
  
end
